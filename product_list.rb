require "unirest"

system "clear"
puts "Choose an option"
puts "[1] See all Products"
puts "[1.1] Search for products name"
puts "[1.2] Sort products by price"
puts "[2] See one Product"
puts "[3] Create a Product"
puts "[4] Update a Product"
puts "[5] Delete a Product"


# input_option = gets.chomp
# if input_option == "1"
#   response = Unirest.get("http://localhost:3000/first_product_method")
#   product = response.body
#   puts JSON.pretty_generate(product)
# elsif input_option == "2"
#   response = Unirest.get("http://localhost:3000/second_product_method")
#   product = response.body
#   puts JSON.pretty_generate(product)
# elsif input_option == "3"
#   response = Unirest.get("http://localhost:3000/third_product_method")
#   product = response.body
#   puts JSON.pretty_generate(product)
  ###############################
input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "1.1"
  puts "Please enter a name"
  search_input = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?input_search_terms=#{search_input}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option =="1.2"
  response = Unirest.get("http://localhost:3000/v1/products?sort_by_price=true")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "2"
  print "Enter a recipe id: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/product/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "3"
  params = {}
  print "Name: "
  params["input_name"] = gets.chomp
  print "Price: "
  params["input_price"] = gets.chomp
  # print "Image Url: "
  # params["input_image_url"] = gets.chomp
  print "Description: "
  params["input_description"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/product", parameters: params)
  product = response.body
  if product["errors"]
    puts "Uh oh! Something went wrong..."
    p product["errors"]
  else
    puts "Here is your product info:"
    puts JSON.pretty_generate(product)
  end
elsif input_option == "4"
  print "enter a product id: "
  product_id = gets.chomp
  params = {}
  print "Name (#{product["name"]}): "
  params["input_name"] = gets.chomp
  print "Price (#{product["price"]}): "
  params["input_price"] = gets.chomp
  # print "image URL (#{product["image_url"]}): "
  # params["input_image_url"] = gets.chomp
  print "Description(#{product["description"]}): "
  params["input_description"] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  if product["errors"]
    puts "Uh oh! Something went wrong..."
    p product["errors"]
  else
    puts "Here is your product info:"
    puts JSON.pretty_generate(product)
  end
elsif input_option == "5"
  print "Enter a Product id: "
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  body = response.body
  puts JSON.pretty_generate(body)
end

 # response = Unirest.get("http://localhost:3000/all_products")
 #  product = response.body
 #  puts JSON.pretty_generate(product)




# system "clear"
# puts "Welcome to Recipe app! Choose an option:"
# puts "[1] See all recipes"
# puts "[2] See one recipe"
# puts "[3] Create a recipe"
# puts "[4] Update a recipe"

# input_option = gets.chomp
# if input_option == "1"
#   response = Unirest.get("http://localhost:3000/v1/products")
#   recipes = response.body
#   puts JSON.pretty_generate(recipes)
# elsif input_option == "2"
#   print "Enter a recipe id: "
#   recipe_id = gets.chomp
#   response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
#   recipe = response.body
#   puts JSON.pretty_generate(recipe)
# elsif input_option == "3"
#   params = {}
#   print "Title: "
#   params["input_title"] = gets.chomp
#   print "Chef: "
#   params["input_chef"] = gets.chomp
#   print "Ingredients: "
#   params["input_ingredients"] = gets.chomp
#   print "Directions: "
#   params["input_directions"] = gets.chomp
#   response = Unirest.post("http://localhost:3000/v1/recipes", parameters: params)
#   recipe = response.body
#   puts JSON.pretty_generate(recipe)