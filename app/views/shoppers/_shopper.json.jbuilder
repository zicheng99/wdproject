json.extract! shopper, :id, :email, :address, :name, :current_password, :new_password, :created_at, :updated_at
json.url shopper_url(shopper, format: :json)
