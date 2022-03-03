class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[show destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  # def destroy
  #   @pokemon.destroy
  #   redirect_to pokemons_path
  # end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :type_1, :type_2)
  end
end
