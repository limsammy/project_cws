json.extract! product, :id, :name, :code, :company_id, :price, :stock_in_hand, :created_at, :updated_at
json.url product_url(product, format: :json)
