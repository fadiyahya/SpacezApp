json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :officetype, :price, :aminities, :city, :location, :rules, :contacts
  json.url listing_url(listing, format: :json)
end
