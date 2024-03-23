json.extract! movie, :id, :title, :description, :upload_date, :likes, :hates, :created_at, :updated_at
json.url movie_url(movie, format: :json)
