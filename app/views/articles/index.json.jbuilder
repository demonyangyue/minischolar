json.array!(@articles) do |article|
  json.extract! article, :id, :title, :owner, :article_attachment, :attachment, :user_id
  json.url article_url(article, format: :json)
end
