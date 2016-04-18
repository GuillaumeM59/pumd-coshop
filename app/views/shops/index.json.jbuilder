json.array!(@shops) do |shop|
  json.extract! shop, :id, :brand_id, :adress, :zipcode, :city, :drive
  json.url shop_url(shop, format: :json)
end
