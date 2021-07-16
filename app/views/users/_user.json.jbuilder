json.extract! user, :id, :email, :password_digest, :fname, :lastname, :created_at, :updated_at
json.url user_url(user, format: :json)
