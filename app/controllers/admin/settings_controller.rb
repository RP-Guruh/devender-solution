class Admin::SettingsController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'
  before_action :set_setting, only: %i[ show edit update destroy ]

  # GET /settings or /settings.json
  def index
    @q = Setting.ransack(params[:q])
    scope = @q.result(distinct: true).order(created_at: :desc)

    @settings = scope.all
  end

  # GET /settings/1 or /settings/1.json
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings or /settings.json
  def create
    @setting = Setting.new(setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_to admin_settings_path, notice: "Setting was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @setting] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings/1 or /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to [:admin, @setting], notice: "Setting was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: [:admin, @setting] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1 or /settings/1.json
  def destroy
    @setting.destroy!

    respond_to do |format|
      format.html { redirect_to admin_settings_path, notice: "Setting was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def setting_params
      params.expect(setting: [ :key, :value ])
    end
end
