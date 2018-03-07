require "unirest"

system "clear"
puts "Here are your products!"

 response = Unirest.get("http://localhost:3000/all_products")
  product = response.body
  puts JSON.pretty_generate(product)


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
