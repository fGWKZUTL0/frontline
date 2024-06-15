json.extract! patient, :id, :family_name, :first_name, :born_date, :created_at, :updated_at
json.url patient_url(patient, format: :json)
