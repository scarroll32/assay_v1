class UcscQuery
  require 'bio-ucsc'
  include Bio


  class << self
    def perform(batch,forward_base_pair_offset,reverse_base_pair_offset)
      Delayed::Worker.logger.debug("UCSC Log Entry")
      apply_primer3_defaults(batch.id)
      #ucsc_get_location(batch_id)
      if Batch::COSMIC_VERSIONS.include?(batch.source)
        cosmics_get_location(batch.id)
      end
      hg19_get_seq(batch.id,forward_base_pair_offset,reverse_base_pair_offset)
      Batch.update(batch.id, :step => 'configure', :status => 'ready')
    end

    handle_asynchronously :perform, queue: :ucsc_queue,  :run_at => Proc.new { 1.second.from_now }
  end



  def self.apply_primer3_defaults(batch_id)
    Batch.update(batch_id, :step => 'p3_defaults', :status => 'processing')
    template = Primer3Template.new
    primer3_setting = Primer3Setting.first!  # TODO hard-coded from parm page - need to fix
    @batch_details = BatchDetail.find(:all, :conditions => {:batch_id => batch_id}).each do |batch_detail|
      batch_detail.status = 'processing'
      batch_detail.save
      @primer3_parameter = Primer3Parameter.new
      #@primer3_parameter.attributes=(template.defaults)
      @primer3_parameter.attributes = primer3_setting.attributes.select{ |k, v| not %w{id type user_id created_at updated_at}.include?(k) }
      @primer3_parameter.batch_detail_id = batch_detail.id
      @primer3_parameter.sequence_id = "Default Sequence #{batch_detail.id}/#{batch_detail.batch_id}"
      #@primer3_parameter.primer_thermodynamic_parameters_path = "/home/assay/apps/assay/shared/bin/primer3/src/primer3_config/"
      #@primer3_parameter.primer_thermodynamic_parameters_path = "/Users/sean/Dropbox/bin/rails/assay/bin/primer3/src/primer3_config/"
      @primer3_parameter.primer_thermodynamic_parameters_path = "#{Rails.root}/bin/primer3/src/primer3_config/"
      @primer3_parameter.generated = false
      @primer3_parameter.status = 'ready'
      @primer3_parameter.save
    end
    Batch.update(batch_id, :step => 'p3_defaults', :status => 'completed')
  end




  # Cosmics table holds location so dont' need remote call to UCSC database
  def self.cosmics_get_location(batch_id)
    Rails.logger.debug "cosmics_get_location start"
    Batch.update(batch_id, :step => 'ucsc', :status => 'processing')
    errors_found = false
    @batch_detail = BatchDetail.find(:all, :conditions => {:batch_id => batch_id}).each do |batch_detail|
      batch_detail.status = :processing
      cosmic = Cosmic.find(:all, :conditions => {:cosmic_mut_id => batch_detail.cosmic_mut_id}).first
      if cosmic.nil?
        batch_detail.status = 'not found'
        batch_detail.save
        errors_found = true
      else
        batch_detail.chrom = cosmic.chromosome
        batch_detail.chrom_start = cosmic.grch37_start
        batch_detail.chrom_end = cosmic.grch37_stop
        batch_detail.status = 'ready'
        batch_detail.save
      end
    end
    if errors_found == false
      Batch.update(batch_id, :step => 'ucsc', :status => 'complete')
    else
      Batch.update(batch_id, :step => 'ucsc', :status => 'error')
    end
    Rails.logger.debug "cosmics_get_location end"
  end




  # Retrieve the sequence info from UCSC
  def self.ucsc_get_location(batch_id)
    Batch.update(batch_id, :step => 'ucsc', :status => 'processing')
    errors_found = false

    Ucsc::Hg19.connect
    @batch_detail = BatchDetail.find(:all, :conditions => {:batch_id => batch_id}).each do |batch_detail|
      batch_detail.status = :processing
      ucsc_cosmic = Ucsc::Hg19::Cosmic.find_by_name(batch_detail.cosmic_mut_id)
      if ucsc_cosmic
        batch_detail.bin = ucsc_cosmic.bin
        batch_detail.chrom = ucsc_cosmic.chrom
        batch_detail.chrom_start = ucsc_cosmic.chromStart
        batch_detail.chrom_end = ucsc_cosmic.chromEnd
        batch_detail.status = 'ready'
        batch_detail.save
      else
        batch_detail.status = 'not found'
        errors_found = true
      end
    end
    if errors_found == false
      Batch.update(batch_id, :step => 'ucsc', :status => 'complete')
    else
      Batch.update(batch_id, :step => 'ucsc', :status => 'error')
    end
  end


  # Get the sequence from the .2bit file on the file system
  def self.hg19_get_seq(batch_id,forward_base_pair_offset,reverse_base_pair_offset)
    Rails.logger.debug "get 2bit start"

    Batch.update(batch_id, :step => 'sequence', :status => 'processing')
    errors_found = false
    Dir.chdir(Rails.root)
    seqfile = Ucsc::File::Twobit.open("bin/hg19/hg19/hg19.2bit")
    @batch_detail = BatchDetail.find(:all, :conditions => {:batch_id => batch_id,
                                                           :status => 'ready'}).each do |batch_detail|                                                             
      extracted_seq = extract_seq(batch_detail.chrom,batch_detail.chrom_start,batch_detail.chrom_end,seqfile,forward_base_pair_offset,reverse_base_pair_offset)
      #chrom = convert_chrom(batch_detail.chrom)                                                          
      #subsequence = "chr#{chrom}:#{batch_detail.chrom_start - 100}-#{batch_detail.chrom_end + 100}"
      #extracted_seq = seq.subseq(subsequence)
      #Rails.logger.debug "seq: >#{seq}<  DNA: #{extracted_seq} #{subsequence }"
      if extracted_seq
        batch_detail.dna = extracted_seq
        batch_detail.status = 'ready'
        batch_detail.save
        Rails.logger.debug "#{batch_detail.id} DNA sequence: #{batch_detail.dna}"
        p3 = Primer3Parameter.where(:batch_detail_id => batch_detail.id).first
        p3.sequence_template = extracted_seq
        p3.save
      else
        batch_detail.status = 'not found'
        errors_found = true
      end
    end
    if errors_found == false
      Batch.update(batch_id, :step => 'sequence', :status => 'completed')
    else
      Batch.update(batch_id, :step => 'sequence', :status => 'error')
    end
    Rails.logger.debug "get 2bit end"
  end
  
  
  def self.convert_chrom(chromosome)
    case chromosome
    when '23'
      chrom = 'X'
    when '24'
      chrom = 'Y'
    when '25'
      chrom = 'M'
    else  
      chrom = chromosome
    end
    chrom
  end
  
  
  def self.extract_seq(batch_detail_chrom,chrom_start,chrom_end,seqfile,forward_base_pair_offset,reverse_base_pair_offset)
    chrom = convert_chrom(batch_detail_chrom) 
    Rails.logger.info "forward: >#{forward_base_pair_offset}< reverse: >#{reverse_base_pair_offset}< "  
    Rails.logger.info "chrom: #{chrom}  chrom_start: #{chrom_start}  chrom_end: #{chrom_end}"                                                      
    subsequence = "chr#{chrom}:#{chrom_start - forward_base_pair_offset.to_i}-#{chrom_end + reverse_base_pair_offset.to_i}"
    extracted_seq = seqfile.subseq(subsequence)
    Rails.logger.debug "seqfile: >#{seqfile}<  DNA: #{extracted_seq} #{subsequence }"
    extracted_seq
  end


end
