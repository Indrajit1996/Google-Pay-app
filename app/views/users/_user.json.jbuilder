json.extract! user, :id, :phone_number, :email_id, :name, :amount, :created_at, :updated_at
json.url user_url(user, format: :json)
