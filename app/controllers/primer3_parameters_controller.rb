class Primer3ParametersController < ApplicationController

  def index
    @primer3_parameters = Primer3Parameter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @primer3_parameters }
    end
  end


  def show
    @primer3_parameter = Primer3Parameter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @primer3_parameter }
    end
  end


  def new
    #template = Primer3Template.new
    @primer3_parameter = Primer3Parameter.new
    #@primer3_parameter.attributes=(template.defaults)
    #@primer3_parameter.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @primer3_parameter }
    end
  end

  # GET /primer3_settings/1/edit
  def edit
    @primer3_parameter = Primer3Parameter.find(params[:id])
  end


  def create
    @primer3_parameter = Primer3Parameter.new(params[:primer3_setting])

    respond_to do |format|
      if @primer3_parameter.save
        format.html { redirect_to edit_primer3_setting_path(@primer3_parameter), notice: 'Primer3 setting was successfully created.' }
        format.json { render json: @primer3_parameter, status: :created, location: @primer3_parameter }
      else
        format.html { render action: "new" }
        format.json { render json: @primer3_parameter.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @primer3_parameter = Primer3Parameter.find(params[:id])
    batch_detail_id = @primer3_parameter.batch_detail_id

    respond_to do |format|
      if @primer3_parameter.update_attributes(params[:primer3_parameter])
        format.html { redirect_to edit_batch_detail_primer3_parameter_path(@primer3_parameter.batch_detail_id,@primer3_parameter), notice: 'Primer3 Parameters was
          re successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @primer3_parameter.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @primer3_parameter = Primer3Parameter.find(params[:id])
    @primer3_parameter.destroy

    respond_to do |format|
      format.html { redirect_to primer3_parameters_url }
      format.json { head :no_content }
    end
  end
end
