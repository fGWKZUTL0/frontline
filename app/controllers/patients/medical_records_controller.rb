module Patients
  class MedicalRecordsController < ApplicationController
    before_action :set_medical_record, only: %i[ show edit update destroy ]

    # GET /medical_records or /medical_records.json
    def index
      @medical_records = MedicalRecord.all
    end

    # GET /medical_records/1 or /medical_records/1.json
    def show
    end

    # GET /medical_records/new
    def new
      @patient = Patient.find(params[:patient_id])
      @medical_record = @patient.medical_records.build
    end

    # GET /medical_records/1/edit
    def edit
    end

    # POST /medical_records or /medical_records.json
    def create
      MultiTenant.with(@hospital) do
        @patient = Patient.find(params[:patient_id])
        @medical_record = MedicalRecord.new(medical_record_params)

        @medical_record.patient_id = @patient.id
        @medical_record.writer_id = current_user.id

        if @medical_record.save
          redirect_to patient_medical_record_path(@medical_record.patient.id, @medical_record.id), notice: "Medical record was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
      end
    end

    # PATCH/PUT /medical_records/1 or /medical_records/1.json
    def update
      MultiTenant.with(@hospital) do
        if @medical_record.update(medical_record_params)
          redirect_to patient_medical_record_path(@medical_record.patient.id, @medical_record.id), notice: "Medical record was successfully updated."
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end

    # DELETE /medical_records/1 or /medical_records/1.json
    def destroy
      @medical_record.destroy!

      respond_to do |format|
        format.html { redirect_to medical_records_url, notice: "Medical record was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_medical_record
        @medical_record = MedicalRecord.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def medical_record_params
        params.require(:medical_record).permit(:title, :content)
      end
  end
end
