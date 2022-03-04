puts "Cleaning database..."
Pokemon.destroy_all

# puts "Adding Pokémons..."
# pikachu = { name: "Pikachu", type_1: "electric" }
# charmander = { name: "Charmander", type_1: "fire" }
# charizard = { name: "Charizard", type_1: "fire", type_2: "flying" }

# [pikachu, charmander, charizard].each do |attributes|
#   pokemon = Pokemon.new(attributes)
#   pokemon.save!
#   puts "#{pokemon.name} added!"
# end
# puts "Finished!"

require "open-uri"
require "json"

898.times do |i|
  pokedex = "https://pokeapi.co/api/v2/pokemon/#{i + 1}/"
  pokedex_serialized = URI.open(pokedex).read
  pokedex_response = JSON.parse(pokedex_serialized)

  if pokedex_response["types"].length == 2
    type_1 = pokedex_response["types"][0]["type"]["name"]
    type_2 = pokedex_response["types"][1]["type"]["name"]
  else
    type_1 = pokedex_response["types"][0]["type"]["name"]
    type_2 = nil
  end

  Pokemon.create!(
    name: pokedex_response["name"],
    image_url: pokedex_response["sprites"]["other"]["official-artwork"]["front_default"],
    type_1: type_1,
    type_2: type_2
  )
  puts pokedex_response["name"]
end
