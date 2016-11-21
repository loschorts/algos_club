json.extract! question, :id, :user_id, :body, :title, :created_at, :updated_at
json.url question_url(question, format: :json)