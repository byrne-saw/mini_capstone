require 'http'

# index
# response = HTTP.get("http://localhost:3000/api/products")
# p response.parse

# show
# response = HTTP.get("http://localhost:3000/api/products/1")
# p response.parse

# create

response = HTTP.post("http://localhost:3000/api/products", form: {name: "Nutes", price: 89, description: "V Cool", image_url: "www.google.com/sadfsdf"})

p response.parse