json.array!(@users) do |user|
  json.extract! user, :id, :name, :first_name, :city
  json.url user_url(user, format: :json)
end
