json.extract! header, :id, :game_id, :axis, :position, :value, :created_at, :updated_at
json.url header_url(header, format: :json)
