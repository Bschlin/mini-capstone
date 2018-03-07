require "unirest"

system "clear"
puts "Choose an option"
puts "[1] Product 1"
puts "[2] Product 2"
puts "[3] Product 3"


input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/first_product_method")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "2"
  response = Unirest.get("http://localhost:3000/second_product_method")
  product = response.body
   puts JSON.pretty_generate(product)
elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/third_product_method")
  product = response.body
  puts JSON.pretty_generate(product)
end

 # response = Unirest.get("http://localhost:3000/all_products")
 #  product = response.body
 #  puts JSON.pretty_generate(product)


# input_option = gets.chomp
# if input_option == "1"
#   response = Unirest.get("http://localhost:3000/all_products")
#   product = response.body
#   puts JSON.pretty_generate(product)
# elsif input_option == "2"
#   response = Unirest.get("http://localhost:3000/all_products")
#   product = response.body
#    puts JSON.pretty_generate(product)
# elsif input_option == "3"
#   response = Unirest.get("http://localhost:3000/all_products")
#   product = response.body
#   puts JSON.pretty_generate(product)
# end


