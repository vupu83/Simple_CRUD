json.extract! person, :id, :name, :bio, :birth, :created_at, :updated_at
json.url person_url(person, format: :json)