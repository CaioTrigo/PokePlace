class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show]

  def index
    @pokemons = user.pokemons.all
  end

  def show
  end

  private

  def pokemon_params
    params.require(:trade).permit(:name, :type_1, :type_2, :image_url)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
