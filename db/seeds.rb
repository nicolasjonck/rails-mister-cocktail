require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "clearing DB"
Ingredient.destroy_all
p "starting seeding"


url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
drink_serialized = open(url).read
user = JSON.parse(drink_serialized)

user["drinks"].length.times do
  ingredients_hash = user["drinks"].sample
  ingredient = Ingredient.new(name: ingredients_hash.values[0])

  puts "#{ingredient.name} saved!" if ingredient.save
end

p "seeding finished"

Cocktail.create(name: "Mojito")






