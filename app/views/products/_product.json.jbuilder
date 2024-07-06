json.extract! product, :id, :product_code, :price, :product_name, :created_at, :updated_at
json.url product_url(product, format: :json)
