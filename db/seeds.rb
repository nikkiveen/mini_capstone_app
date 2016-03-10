# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do 
  name = Faker::Lorem.word
  image = Faker::Avatar.image
  price = Faker::Number.number(3)
  description = Faker::Lorem.sentence
  Product.create(name: name, image: image, price: price, description: description)
end