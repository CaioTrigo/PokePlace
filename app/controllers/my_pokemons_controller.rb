class MyPokemonsController < ApplicationController
  before_action :set_my_pokemon, only: %i[show destroy]

  def index
    @my_pokemons = current_user.my_pokemons.all
  end

  def show
  end

  def new
    @my_pokemon = MyPokemon.new
  end

  def create
    @my_pokemon = MyPokemon.new
    @pokemon = Pokemon.find(params[:my_pokemon][:pokemon_id])
    @my_pokemon.pokemon = @pokemon
    @my_pokemon.user = current_user
    if @my_pokemon.save
      redirect_to my_pokemons_path
    else
      render :new
    end
  end

  private

  def set_my_pokemon
    @my_pokemon = MyPokemon.find(params[:id])
  end
end
