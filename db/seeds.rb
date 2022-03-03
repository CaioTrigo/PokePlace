# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Pokemon.destroy_all

puts "Adding Pokémons..."
pikachu = { name: "Pikachu", type_1: "electric" }
charmander = { name: "Charmander", type_1: "fire" }
charizard = { name: "Charizard", type_1: "fire", type_2: "flying" }

[pikachu, charmander, charizard].each do |attributes|
  pokemon = Pokemon.new(attributes)
  pokemon.save!
  puts "#{pokemon.name} added!"
end
puts "Finished!"
