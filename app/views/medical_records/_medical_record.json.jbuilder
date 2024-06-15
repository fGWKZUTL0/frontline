json.extract! medical_record, :id, :patient_id, :writing_date, :user_id, :created_at, :updated_at
json.url medical_record_url(medical_record, format: :json)
