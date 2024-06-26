class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :build_labels, only: %i[ new create edit update ]

  # GET /patients or /patients.json
  def index
    @patients = Patient.all.preload(doctor: [:user, :position], nurse: [:user, :position])
  end

  # GET /patients/1 or /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients or /patients.json
  def create
    MultiTenant.with(@hospital) do
      @patient = Patient.new(patient_params)
      @patient.tenant_id = current_user.tenant_id

      respond_to do |format|
        if @patient.save
          format.html { redirect_to patient_url(@patient), notice: "Patient was successfully created." }
          format.json { render :show, status: :created, location: @patient }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    MultiTenant.with(@hospital) do
      respond_to do |format|
        if @patient.update(patient_params)
          format.html { redirect_to patient_url(@patient), notice: "Patient was successfully updated." }
          format.json { render :show, status: :ok, location: @patient }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    @patient.destroy!

    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:family_name, :first_name, :born_date, :doctor_id, :nurse_id)
    end

    def build_labels
      @doctors = Doctor.joins(:user).preload(:user)
      @nurses = Nurse.joins(:user).preload(:user)
    end
end
