json.extract! article, :id, :headline, :lead, :author, :body, :url_img, :created_at, :updated_at
json.url article_url(article, format: :json)
