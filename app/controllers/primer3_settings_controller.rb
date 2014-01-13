class Primer3SettingsController < ApplicationController

  def index
    @primer3_settings = Primer3Setting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @primer3_settings }
    end
  end


  def show
    @primer3_setting = Primer3Setting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @primer3_setting }
    end
  end


  def new
    template = Primer3Template.new
    @primer3_setting = Primer3Setting.new
    @primer3_setting.attributes=(template.defaults)
    @primer3_setting.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @primer3_setting }
    end
  end

  # GET /primer3_settings/1/edit
  def edit
    @primer3_setting = Primer3Setting.find(params[:id])
  end


  def create
    @primer3_setting = Primer3Setting.new(params[:primer3_setting])

    respond_to do |format|
      if @primer3_setting.save
        format.html { redirect_to edit_primer3_setting_path(@primer3_setting), notice: 'Primer3 setting was successfully created.' }
        format.json { render json: @primer3_setting, status: :created, location: @primer3_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @primer3_setting.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @primer3_setting = Primer3Setting.find(params[:id])

    respond_to do |format|
      if @primer3_setting.update_attributes(params[:primer3_setting])
        format.html { redirect_to edit_primer3_setting_path(@primer3_setting), notice: 'Primer3 setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @primer3_setting.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @primer3_setting = Primer3Setting.find(params[:id])
    @primer3_setting.destroy

    respond_to do |format|
      format.html { redirect_to primer3_settings_url }
      format.json { head :no_content }
    end
  end
end
