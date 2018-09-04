json.id product.id
json.name product.name
json.price product.price
json.descrption product.description
json.image_url product.image_url
json.discount_flag product.is_discounted?
json.tax product.tax
json.total product.total
json.stocked product.stocked

json.formated do 
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end