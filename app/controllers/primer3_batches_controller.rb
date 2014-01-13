class Primer3BatchesController < ApplicationController
  # GET /primer3_batches
  # GET /primer3_batches.json
  def index
    @primer3_batches = Primer3Batch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @primer3_batches }
    end
  end

  # GET /primer3_batches/1
  # GET /primer3_batches/1.json
  def show
    @primer3_batch = Primer3Batch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @primer3_batch }
    end
  end

  # GET /primer3_batches/new
  # GET /primer3_batches/new.json
  def new
    @primer3_batch = Primer3Batch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @primer3_batch }
    end
  end

  # GET /primer3_batches/1/edit
  def edit
    @primer3_batch = Primer3Batch.find(params[:id])
  end

  # POST /primer3_batches
  # POST /primer3_batches.json
  def create
    @primer3_batch = Primer3Batch.new(params[:primer3_batch])

    respond_to do |format|
      if @primer3_batch.save
        format.html { redirect_to @primer3_batch, notice: 'Primer3 batch was successfully created.' }
        format.json { render json: @primer3_batch, status: :created, location: @primer3_batch }
      else
        format.html { render action: "new" }
        format.json { render json: @primer3_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /primer3_batches/1
  # PUT /primer3_batches/1.json
  def update
    @primer3_batch = Primer3Batch.find(params[:id])

    respond_to do |format|
      if @primer3_batch.update_attributes(params[:primer3_batch])
        format.html do
          @batch_detail = BatchDetail.find(@primer3_batch.batch_detail_id)
          flash[:notice] = 'Primer3 batch was successfully updated.'
          redirect_to batch_batch_detail_url(@batch_detail.batch_id, @batch_detail) 
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @primer3_batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primer3_batches/1
  # DELETE /primer3_batches/1.json
  def destroy
    @primer3_batch = Primer3Batch.find(params[:id])
    @primer3_batch.destroy

    respond_to do |format|
      format.html { redirect_to primer3_batches_url }
      format.json { head :no_content }
    end
  end
end
