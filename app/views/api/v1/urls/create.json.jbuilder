if @url.errors.present?
  json.errors @url.errors.full_messages
else
  json.url do
	json.original_url @url.original_url
	json.shortened_url @url.shortened_url
	json.created_at @url.created_at
  end
end