json.array!(@emails) do |email|
  json.extract! email, :id, :new_review
  json.url email_url(email, format: :json)
end
