# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


product = Product.new({name: "Tide Pods", price: 15, image_url: "https://www.google.com/", description: "Cleaning product"})
product = Product.new({name: "Paper Towels", price: 10, image_url: "https://en.wikipedia.org/wiki/Paper_towel", description: "Kitchen product"})
product = Product.new({name: "Kleenex", price: 5, image_url: "https://www.merriam-webster.com/dictionary/toiletry", description: "Toiletry product"})
