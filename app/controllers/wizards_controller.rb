class WizardsController < ApplicationController
  require 'roo'
  include Roo
  # The Wizard state controls which page is visible and what fields are active
  # Each batch also has a step and status which are independent from the wizard state
  # A batch can be left half done and picked up at any time
  # Clicking on the :start tab of the wizard always drops the current batch from the wizard state
  
  FIELDS =  {
              stanford:         'Stanford',
              vogel:            'Vogelstein',
              ampliseq:         'Ampliseq',
              cosmic_mut_id:    'Cosmic mut',
              gene:             'Gene',
              accession_number: 'Accession number',
              mut_description:  'Mut description',
              mut_syntax_cds:   'Mut syntax cds',
              mut_syntax_aa:    'Mut syntax aa',
              chromosome:       'Chromosome',
              grch37_start:     'Start',
              grch37_stop:      'Stop',
              mut_nt:           'Mut nt',
              mut_aa:           'Mut aa',
              tumour_site:      'Tumour site',
              mutated_samples:  'Mutated samples',
              examined_samples: 'Examined samples',
              mut_freq:         'Mut freq'
            }

      

  def import
    @batch = Batch.import(params[:file],current_user)
    #redirect_to root_url, notice: "Spreadsheet imported."
    Rails.logger.debug "About to call UCSC perform"
    UcscQuery.perform(@batch,150,150)
    redirect_to locate_url(@batch.id)
  end


  def start
    @state = :start
    @batch_num = 0
    @batches = Batch.all
    render 'start/start'
  end


  def select
    @state = :select
    @batch_num = 0
    @search = Cosmic.search(params[:q])
    @cosmics = @search.result.paginate(:page => params[:page])
    @search.build_condition
    @fields = FIELDS
    render 'select/select'
  end


  def export
    @search = Cosmic.search(params[:q])
    @cosmics = @search.result
    
    @hidden_fields = []
    @hidden_fields = params[:hf].values if params[:hf]

    respond_to do |format|
      format.csv { send_data Cosmic.generate_csv(@cosmics, FIELDS.keys.map(&:to_s) - @hidden_fields),
                             type: Mime::CSV,
                             disposition: "attachment; filename=export-#{Date.today.to_s}.csv" }
    end
  end

  def search
    render 'select/select'
  end

  def selected # lookup is ready
    @state = :selected
    @batch_num = 0
    # render ???
  end


  ##def select_btn
  def locate_btn
     # locate sequence pressed; create the header and detail lines for the batch
     #Cosmic.update_all({selected: true}, {cosmic_mut_id: params[:cosmic_mut_ids]})
     @batch = Batch.create!(:user_id => current_user.id,
                            :primer3_setting_id => 2,
                            :step => 'locate', :status => 'ready',
                            :source => 'cosmic66')
     @batch.description =  "Batch: #{@batch.id}"
     @batch.save

     if params[:select_all]
       q = JSON.parse(params[:query_json])
       data = Cosmic.search(q).result.pluck(:cosmic_mut_id)

     else
       data = params[:cosmic_mut_ids]
     end
     
     # TODO Base this on cosmics.id instead of cosmics_mut_id as there are some dups
     data.each do |cosmic_mut_id|
       @batch_detail = BatchDetail.create!(:batch_id => @batch.id,
                                           :cosmic_mut_id => cosmic_mut_id,
                                           :status => 'ready')
       @batch_detail.save
     end
   
     #@batch_num = @batch.id
 	   forward_base_pair_offset = params[:forward_base_pair_offset].to_i
 	   reverse_base_pair_offset = params[:reverse_base_pair_offset].to_i
     Rails.logger.debug "About to call UCSC perform 2"
     UcscQuery.perform(@batch,forward_base_pair_offset,reverse_base_pair_offset)
     #redirect_to locate_url(@batch_num)
     redirect_to locate_url(@batch.id)
   end


  def locate
    @state = :locate
    @batch_num = params[:id]
    @batch = Batch.find(@batch_num)
    if @batch.step == 'configure' && @batch.status = 'ready'
      respond_to do |format|
        format.html { redirect_to configure_url(@batch_num) }
        format.json { render json: {'status' => 'ready'} }
      end
    else
      respond_to do |format|
        format.html { render 'batches/show' }
        format.json { render json: {'status' => 'processing'} }
      end
    end
  end


  def configure
    # unlock fields - TBD
    @state = :configure
    @batch_num = params[:id]
    @batch = Batch.find(@batch_num)
    render 'batches/edit'
  end


  def primer3_btn    # primer3 button pressed
    @state = :primer3
    @batch_num = params[:id]
    @batch = Batch.find(@batch_num)
    Rails.logger.debug "About to call Primer3Query"
    Primer3Query.perform(@batch.id)
    redirect_to assay_url(@batch_num)
  end


  def primer3  # primer 3 processing, tab is yellow
    @state = :primer3
    @batch_num = params[:id]
    @batch = Batch.find(@batch_num)
    if @batch.step == 'assay' && @batch.status == 'completed'  ## This needs to be done via javascript
      redirect_to assay_url(@batch_num)
    else
      #render 'batches/show'
      #render 'batches/edit'
      redirect_to edit_batch_path(@batch_num)
    end
  end


  def assay # display the assay results
    @state = :assay
    @batch_num = params[:id]
    @batch = Batch.find(@batch_num)
    render 'batches/show'
  end

  def batch_state
    @batch = Batch.find(params[:id])
    render :json => { :batch_step => @batch.step, :batch_status => @batch.status }
  end

  def splinter
    SplinterQuery.perform(params[:id])
  end

end
