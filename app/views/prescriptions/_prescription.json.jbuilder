json.extract! prescription, :id, :prescription_id, :doctor_id, :user_id, :title, :description, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
