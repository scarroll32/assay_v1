
class Batch < ActiveRecord::Base
  attr_accessible :batch_details_attributes, :primer3_parameters_attributes, :batch, :step, :status, :status_timestamp, 
                  :description, :details, :user_id, :primer3_setting_id, :source

  STEP_OPTIONS = %w(select prepare locate sequence assay)
  STATUS_OPTIONS = %w(initialize processing completed error)
  SOURCE_OPTIONS = %w(upload cosmic65 cosmic66 cosmic67)
  COSMIC_VERSIONS = %w(cosmic65 cosmic66 cosmic67)

  belongs_to :users
  has_many :batch_details, :dependent => :destroy
  
  
  def self.import(file,user)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    batch = Batch.new
    batch.user_id = user.id
    batch.source = 'upload'
    batch.description = file.original_filename
    batch.primer3_setting_id = 2
    batch.step = 'locate'
    batch.status = 'ready'
    batch.save!
    (2..spreadsheet.last_row).each do |i|
      batch_detail = BatchDetail.new
      row = Hash[[header, spreadsheet.row(i)].transpose]
      Rails.logger.debug "row: #{row}, batch_id: #{batch.id}"
      batch_detail.batch_id = batch.id
      batch_detail.chrom = row['chrom']
      batch_detail.chrom_start = row['chrom_start'].to_i
      batch_detail.chrom_end = row['chrom_end'].to_i
      batch_detail.status = 'ready'
      batch_detail.save!
    end
    return batch
  end
  

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  
  
  #has_many :primer3_parameters, :dependent => :destroy
  
  #accepts_nested_attributes_for :batch_details, allow_destroy: true
  #accepts_nested_attributes_for :primer3_parameters, allow_destroy: true
  
  
  #has_one :primer3_setting, :dependent => :destroy
  
=begin
  def apply_primer3_defaults(batch_id)
    @batch = Batch.where(:id => batch_id).first
    @batch.primer3_setting_id = 38
    @batch.save
    @primer3_settings = Primer3Setting.where(:id => @batch.primer3_setting_id).first
    @batch_details = BatchDetail.find(:all, :conditions => {:batch_id => @batch.id}).each do |batch_detail|
      Primer3Batch.where(:batch_detail_id => batch_detail.id).first_or_create do |primer3_batch|
          #primer3_batch.p3_file_type = @primer3_settings.p3_file_type
          primer3_batch.primer_first_base_index = @primer3_settings.primer_first_base_index
          primer3_batch.primer_task = @primer3_settings.primer_task
          primer3_batch.p3_file_id = @batch.description
          primer3_batch.primer_min_three_prime_distance = @primer3_settings.primer_min_three_prime_distance
          primer3_batch.primer_explain_flag = @primer3_settings.primer_explain_flag
          primer3_batch.primer_mispriming_library = @primer3_settings.primer_mispriming_library
          primer3_batch.primer_max_library_mispriming = @primer3_settings.primer_max_library_mispriming
          primer3_batch.primer_pair_max_library_mispriming = @primer3_settings.primer_pair_max_library_mispriming
          primer3_batch.primer_product_size_range = @primer3_settings.primer_product_size_range
          primer3_batch.primer_num_return = @primer3_settings.primer_num_return
          primer3_batch.primer_max_end_stability = @primer3_settings.primer_max_end_stability
          primer3_batch.primer_max_self_any_th = @primer3_settings.primer_max_self_any_th
          primer3_batch.primer_max_self_end_th = @primer3_settings.primer_max_self_end_th
          primer3_batch.primer_pair_max_compl_any_th = @primer3_settings.primer_pair_max_compl_any_th
          primer3_batch.primer_pair_max_compl_end_th = @primer3_settings.primer_pair_max_compl_end_th
          primer3_batch.primer_max_hairpin_th = @primer3_settings.primer_max_hairpin_th
          primer3_batch.primer_max_template_mispriming_th = @primer3_settings.primer_max_template_mispriming_th
          primer3_batch.primer_pair_max_template_mispriming_th = @primer3_settings.primer_pair_max_template_mispriming_th
          primer3_batch.primer_min_size = @primer3_settings.primer_min_size
          primer3_batch.primer_opt_size = @primer3_settings.primer_opt_size
          primer3_batch.primer_max_size = @primer3_settings.primer_max_size
          primer3_batch.primer_min_tm = @primer3_settings.primer_min_tm
          primer3_batch.primer_opt_tm = @primer3_settings.primer_opt_tm
          primer3_batch.primer_max_tm = @primer3_settings.primer_max_tm
          primer3_batch.primer_pair_max_diff_tm = @primer3_settings.primer_pair_max_diff_tm
          primer3_batch.primer_tm_formula = @primer3_settings.primer_tm_formula
          primer3_batch.primer_salt_monovalent = @primer3_settings.primer_salt_monovalent
          primer3_batch.primer_salt_corrections = @primer3_settings.primer_salt_corrections
          primer3_batch.primer_salt_divalent = @primer3_settings.primer_salt_divalent
          primer3_batch.primer_dntp_conc = @primer3_settings.primer_dntp_conc
          primer3_batch.primer_dna_conc = @primer3_settings.primer_dna_conc
          primer3_batch.primer_thermodynamic_oligo_alignment = @primer3_settings.primer_thermodynamic_oligo_alignment
          primer3_batch.primer_thermodynamic_template_alignment = @primer3_settings.primer_thermodynamic_template_alignment
          primer3_batch.primer_lowercase_masking = @primer3_settings.primer_lowercase_masking
          primer3_batch.primer_min_gc = @primer3_settings.primer_min_gc
          primer3_batch.primer_max_gc = @primer3_settings.primer_max_gc
          primer3_batch.primer_max_ns_accepted = @primer3_settings.primer_max_ns_accepted
          primer3_batch.primer_max_poly_x = @primer3_settings.primer_max_poly_x
          primer3_batch.primer_outside_penalty = @primer3_settings.primer_outside_penalty
          primer3_batch.primer_gc_clamp = @primer3_settings.primer_gc_clamp
          primer3_batch.primer_liberal_base = @primer3_settings.primer_liberal_base
          primer3_batch.primer_lib_ambiguity_codes_consensus = @primer3_settings.primer_lib_ambiguity_codes_consensus
          primer3_batch.primer_pick_anyway = @primer3_settings.primer_pick_anyway
          primer3_batch.primer_wt_tm_lt = @primer3_settings.primer_wt_tm_lt
          primer3_batch.primer_wt_tm_gt = @primer3_settings.primer_wt_tm_gt
          primer3_batch.primer_wt_size_lt = @primer3_settings.primer_wt_size_lt
          primer3_batch.primer_wt_size_gt = @primer3_settings.primer_wt_size_gt
          primer3_batch.primer_wt_gc_percent_lt = @primer3_settings.primer_wt_gc_percent_lt
          primer3_batch.primer_wt_gc_percent_gt = @primer3_settings.primer_wt_gc_percent_gt
          primer3_batch.primer_wt_self_any_th = @primer3_settings.primer_wt_self_any_th
          primer3_batch.primer_wt_self_end_th = @primer3_settings.primer_wt_self_end_th
          primer3_batch.primer_wt_hairpin_th = @primer3_settings.primer_wt_hairpin_th
          primer3_batch.primer_wt_num_ns = @primer3_settings.primer_wt_num_ns
          primer3_batch.primer_wt_library_mispriming = @primer3_settings.primer_wt_library_mispriming
          primer3_batch.primer_wt_seq_qual = @primer3_settings.primer_wt_seq_qual
          primer3_batch.primer_wt_end_qual = @primer3_settings.primer_wt_end_qual
          primer3_batch.primer_wt_pos_penalty = @primer3_settings.primer_wt_pos_penalty
          primer3_batch.primer_wt_end_stability = @primer3_settings.primer_wt_end_stability
          primer3_batch.primer_wt_template_mispriming_th = @primer3_settings.primer_wt_template_mispriming_th
          primer3_batch.primer_pair_wt_product_size_lt = @primer3_settings.primer_pair_wt_product_size_lt
          primer3_batch.primer_pair_wt_product_size_gt = @primer3_settings.primer_pair_wt_product_size_gt
          primer3_batch.primer_pair_wt_product_tm_lt = @primer3_settings.primer_pair_wt_product_tm_lt
          primer3_batch.primer_pair_wt_product_tm_gt = @primer3_settings.primer_pair_wt_product_tm_gt
          primer3_batch.primer_pair_wt_diff_tm = @primer3_settings.primer_pair_wt_diff_tm
          primer3_batch.primer_pair_wt_compl_any_th = @primer3_settings.primer_pair_wt_compl_any_th
          primer3_batch.primer_pair_wt_compl_end_th = @primer3_settings.primer_pair_wt_compl_end_th
          primer3_batch.primer_pair_wt_library_mispriming = @primer3_settings.primer_pair_wt_library_mispriming
          primer3_batch.primer_pair_wt_pr_penalty = @primer3_settings.primer_pair_wt_pr_penalty
          primer3_batch.primer_pair_wt_io_penalty = @primer3_settings.primer_pair_wt_io_penalty
          primer3_batch.primer_pair_wt_template_mispriming = @primer3_settings.primer_pair_wt_template_mispriming
          primer3_batch.primer_internal_wt_size_lt = @primer3_settings.primer_internal_wt_size_lt
          primer3_batch.primer_internal_wt_end_qual = @primer3_settings.primer_internal_wt_end_qual
          primer3_batch.primer_internal_max_self_end = @primer3_settings.primer_internal_max_self_end
          primer3_batch.primer_quality_range_min = @primer3_settings.primer_quality_range_min
          primer3_batch.primer_pair_max_compl_end = @primer3_settings.primer_pair_max_compl_end
          primer3_batch.primer_product_max_tm = @primer3_settings.primer_product_max_tm
          primer3_batch.primer_internal_max_size = @primer3_settings.primer_internal_max_size
          primer3_batch.primer_internal_wt_self_any = @primer3_settings.primer_internal_wt_self_any
          primer3_batch.primer_internal_max_poly_x = @primer3_settings.primer_internal_max_poly_x
          primer3_batch.primer_internal_wt_size_gt = @primer3_settings.primer_internal_wt_size_gt
          primer3_batch.primer_sequencing_accuracy = @primer3_settings.primer_sequencing_accuracy
          primer3_batch.primer_internal_wt_tm_gt = @primer3_settings.primer_internal_wt_tm_gt
          primer3_batch.primer_internal_wt_library_mishyb = @primer3_settings.primer_internal_wt_library_mishyb
          primer3_batch.primer_internal_max_gc = @primer3_settings.primer_internal_max_gc
          primer3_batch.primer_pair_wt_compl_any = @primer3_settings.primer_pair_wt_compl_any
          primer3_batch.primer_pick_internal_oligo = @primer3_settings.primer_pick_internal_oligo
          primer3_batch.primer_max_self_end = @primer3_settings.primer_max_self_end
          primer3_batch.primer_quality_range_max = @primer3_settings.primer_quality_range_max
          primer3_batch.primer_internal_dntp_conc = @primer3_settings.primer_internal_dntp_conc
          primer3_batch.primer_internal_min_size = @primer3_settings.primer_internal_min_size
          primer3_batch.primer_internal_min_quality = @primer3_settings.primer_internal_min_quality
          primer3_batch.primer_sequencing_interval = @primer3_settings.primer_sequencing_interval
          primer3_batch.primer_internal_salt_divalent = @primer3_settings.primer_internal_salt_divalent
          primer3_batch.primer_max_self_any = @primer3_settings.primer_max_self_any
          primer3_batch.primer_internal_wt_seq_qual = @primer3_settings.primer_internal_wt_seq_qual
          primer3_batch.primer_pair_wt_compl_end = @primer3_settings.primer_pair_wt_compl_end
          primer3_batch.primer_internal_opt_tm = @primer3_settings.primer_internal_opt_tm
          primer3_batch.primer_sequencing_spacing = @primer3_settings.primer_sequencing_spacing
          primer3_batch.primer_internal_max_self_any = @primer3_settings.primer_internal_max_self_any
          primer3_batch.primer_min_end_quality = @primer3_settings.primer_min_end_quality
          primer3_batch.primer_internal_min_tm = @primer3_settings.primer_internal_min_tm
          primer3_batch.primer_pair_max_compl_any = @primer3_settings.primer_pair_max_compl_any
          primer3_batch.primer_sequencing_lead = @primer3_settings.primer_sequencing_lead
          primer3_batch.primer_pick_left_primer = @primer3_settings.primer_pick_left_primer
          primer3_batch.primer_internal_opt_size = @primer3_settings.primer_internal_opt_size
          primer3_batch.primer_wt_template_mispriming = @primer3_settings.primer_wt_template_mispriming
          primer3_batch.primer_max_end_gc = @primer3_settings.primer_max_end_gc
          primer3_batch.primer_min_quality = @primer3_settings.primer_min_quality
          primer3_batch.primer_internal_max_library_mishyb = @primer3_settings.primer_internal_max_library_mishyb
          primer3_batch.primer_internal_wt_gc_percent_gt = @primer3_settings.primer_internal_wt_gc_percent_gt
          primer3_batch.primer_internal_max_ns_accepted = @primer3_settings.primer_internal_max_ns_accepted
          primer3_batch.primer_wt_self_any = @primer3_settings.primer_wt_self_any
          primer3_batch.primer_max_template_mispriming = @primer3_settings.primer_max_template_mispriming
          primer3_batch.primer_internal_wt_num_ns = @primer3_settings.primer_internal_wt_num_ns
          primer3_batch.primer_internal_wt_self_end = @primer3_settings.primer_internal_wt_self_end
          primer3_batch.primer_product_opt_size = @primer3_settings.primer_product_opt_size
          primer3_batch.primer_product_opt_tm = @primer3_settings.primer_product_opt_tm
          primer3_batch.primer_pair_max_template_mispriming = @primer3_settings.primer_pair_max_template_mispriming
          primer3_batch.primer_inside_penalty = @primer3_settings.primer_inside_penalty
          primer3_batch.primer_internal_min_gc = @primer3_settings.primer_internal_min_gc
          primer3_batch.primer_product_min_tm = @primer3_settings.primer_product_min_tm
          primer3_batch.primer_internal_salt_monovalent = @primer3_settings.primer_internal_salt_monovalent
          primer3_batch.primer_wt_self_end = @primer3_settings.primer_wt_self_end
          primer3_batch.primer_internal_dna_conc = @primer3_settings.primer_internal_dna_conc
          primer3_batch.primer_pick_right_primer = @primer3_settings.primer_pick_right_primer
          primer3_batch.primer_internal_max_tm = @primer3_settings.primer_internal_max_tm
          primer3_batch.primer_internal_wt_gc_percent_lt = @primer3_settings.primer_internal_wt_gc_percent_lt
          primer3_batch.primer_internal_wt_tm_lt = @primer3_settings.primer_internal_wt_tm_lt
          primer3_batch.primer_min_5_prime_overlap_of_junction = @primer3_settings.primer_min_5_prime_overlap_of_junction
          primer3_batch.primer_min_3_prime_overlap_of_junction = @primer3_settings.primer_min_3_prime_overlap_of_junction
          primer3_batch.primer_pair_wt_template_mispriming_th = @primer3_settings.primer_pair_wt_template_mispriming_th
          primer3_batch.primer_internal_opt_gc_percent = @primer3_settings.primer_internal_opt_gc_percent
          primer3_batch.primer_internal_max_self_any_th = @primer3_settings.primer_internal_max_self_any_th
          primer3_batch.primer_internal_max_self_end_th = @primer3_settings.primer_internal_max_self_end_th
          primer3_batch.primer_internal_max_hairpin_th = @primer3_settings.primer_internal_max_hairpin_th
          primer3_batch.primer_internal_wt_self_any_th = @primer3_settings.primer_internal_wt_self_any_th
          primer3_batch.primer_internal_wt_self_end_th = @primer3_settings.primer_internal_wt_self_end_th
          primer3_batch.primer_internal_wt_hairpin_th = @primer3_settings.primer_internal_wt_hairpin_th
          primer3_batch.sequence_force_left_start = @primer3_settings.sequence_force_left_start
          primer3_batch.sequence_force_left_end = @primer3_settings.sequence_force_left_end
          primer3_batch.sequence_force_right_start = @primer3_settings.sequence_force_right_start
          primer3_batch.sequence_force_right_end = @primer3_settings.sequence_force_right_end
          primer3_batch.save
        end
      batch_detail.step = 'initialize'
      batch_detail.status = 'completed'
      batch_detail.save
    end
    Batch.update(@batch, :step => 'prepare', :status => 'complete')
    #session[:step] = :lookup
    #session[:batch_num] = @batch.id
    #redirect_to @batch
    
  end
=end

end


