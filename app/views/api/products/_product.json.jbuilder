json.id product.id
json.name product.name
json.price product.price
json.description product.description
json.discount_flag product.is_discounted?
json.tax product.tax
json.total product.total
json.stocked product.stocked
json.supplier_id product.supplier_id

json.formatted do 
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end

json.supplier do
  json.partial! product.supplier, partial: 'api/suppliers/supplier', as: :supplier 
end

json.images do
  json.array! product.images, partial: 'api/images/image', as: :image
end