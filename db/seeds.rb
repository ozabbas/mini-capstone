# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


product = Product.new( {name:"mug", price: 2, description: "to drink", image_url: "nil"})
product.save

product = Product.new( {name:"cup", price: 0, description: "to get drunk", image_url: "none"})
product.save

