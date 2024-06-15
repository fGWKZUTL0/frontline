class MedicalRecordsController < ApplicationController
  # GET /medical_records or /medical_records.json
  def index
    @medical_records = MedicalRecord.all
  end
end
