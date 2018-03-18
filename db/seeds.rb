# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Supplier.create(name: "Amazon", email: "amazon@email.com", phone_number: "8893645532")
Supplier.create(name: "Walmart", email: "walmart@email.com", phone_number: "3378881121")

product = Product.new({name: "Tide Pods", price: 15.0, description: "Cleaning product", supplier_id: 1})
product.save
product = Product.new({name: "Paper Towels", price: 10.0, description: "Kitchen product", supplier_id: 2})
product.save
product = Product.new({name: "Kleenex", price: 5.0, description: "Toiletry product", supplier_id: 1})
product.save

Image.create(
  url: "http://s32.postimg.org/6mceui22t/wnyx_mug.png",
  product_id: 1
)

Image.create(
  url: "http://www.notcot.com/images/guide.gif",
  product_id: 1
)

Image.create(
  url: "http://25.media.tumblr.com/d2456964024018fd930338c099371104/tumblr_n2m73lTx2Q1svn82uo1_400.gif",
  product_id: 2
)

Image.create(
  url: "https://upload.wikimedia.org/wikipedia/commons/1/14/Lightsaber%2C_silver_hilt%2C_blue_blade.png",
  product_id: 2
)

Image.create(
  url: "http://cdn.shopify.com/s/files/1/0289/1534/products/MalPistol_MP-1_1756x988_e53f9448-81ec-41de-9369-4cbad64f18f5_1024x1024.jpg?v=1401915776",
  product_id: 3
)

Image.create(
  url: "https://s-media-cache-ak0.pinimg.com/736x/9c/15/7b/9c157bea5331463f9c539cbce739a4b8.jpg",
  product_id: 3
)

