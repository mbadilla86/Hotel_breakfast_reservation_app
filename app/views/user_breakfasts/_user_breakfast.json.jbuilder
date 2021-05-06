json.extract! user_breakfast, :id, :user_id, :breakfast_id, :place, :time, :created_at, :updated_at
json.url user_breakfast_url(user_breakfast, format: :json)
