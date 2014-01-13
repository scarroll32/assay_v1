class BatchesController < ApplicationController


  def index
    @batches = Batch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batches }
    end
  end

  def show
    @batch = Batch.find(params[:id])
    @batch_num = @batch.id
    @state = :configure
    
    #@primer3 = Primer3Batch.where(:batch_id => @batch.id)[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @batch }
    end
  end
  
  def assay_review
    @batch = Batch.find(params[:id])
    @state = :assay
    
    #@primer3 = Primer3Batch.where(:batch_id => @batch.id)[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @batch }
    end
  end

  def new
    @batch = Batch.new
    @batch.primer3_batches.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batch }
    end
  end


  def edit
    @batch = Batch.find(params[:id])
    @batch_num = @batch.id
    
  end


  def create
    @batch = Batch.new(params[:batch])
    @batch_num = @batch.id
    

    respond_to do |format|
      if @batch.save
        format.html { redirect_to @batch, notice: 'Batch was successfully created.' }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { render action: "new" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end




  def update
    @batch = Batch.find(params[:id])

    respond_to do |format|
      if (@batch.update_attributes(params[:batch]) && @batch.update_attributes(params[:primer3_parameter]))
        format.html { redirect_to configure_path(@batch), notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy

    respond_to do |format|
      format.html { redirect_to batches_url }
      format.json { head :no_content }
    end
  end
end
