json.extract! menu, :id, :name, :description, :dish_type, :allergens, :category, :price, :created_at, :updated_at
json.url menu_url(menu, format: :json)
