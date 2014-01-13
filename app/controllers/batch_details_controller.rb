class BatchDetailsController < ApplicationController
  
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  # If this is a preflight OPTIONS request, then short-circuit the
  # request, return only the necessary headers and return an empty
  # text/plain.

  def cors_preflight_check
    if request.method == :options
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end
  
  def index
    @batch_details = BatchDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batch_details }
    end
  end


  def show
    @batch = Batch.find(params[:batch_id])
    @batch_detail = BatchDetail.find(params[:id])
    #@primer3_parameters = Primer3Parameter.where(:batch_detail_id => @batch_detail.id)
    #wizard_status_from_batch
     #debugger
  end
  

  def wizard_status_from_batch
    # need to refactor to use for all pages, currently only used by the batch_detail primer3 show pages
    #@batch = Batch.find(batch_id)
    @batch = Batch.find(params[:batch_id])
    #debugger
    if @batch.step == 'locate' || @batch.step == 'sequence'
      @state = :configure
    end
    if @batch.step == 'assay'  
      @state = :assay 
    end
  end
  


  def new
    @batch_detail = BatchDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batch_detail }
    end
  end
  
  
  def edit
    wizard_status_from_batch
    @batch_detail = BatchDetail.find(params[:id])
  end
  
  def assay_review
    wizard_status_from_batch
    @batch_detail = BatchDetail.find(params[:id])
  end


  def create
    @batch_detail = BatchDetail.new(params[:batch_detail])
  end


  def update
    @batch_detail = BatchDetail.find(params[:id])

    respond_to do |format|
      if @batch_detail.update_attributes(params[:batch_detail])
        format.html { redirect_to @batch_detail, notice: 'Batch detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch_detail.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @batch_detail = BatchDetail.find(params[:id])
    @batch_detail.destroy

    respond_to do |format|
      format.html { redirect_to batch_details_url }
      format.json { head :no_content }
    end
  end
end
