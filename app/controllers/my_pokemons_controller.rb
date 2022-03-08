class MyPokemonsController < ApplicationController
  before_action :set_my_pokemon, only: %i[show]

  def index
    @my_pokemons = current_user.my_pokemons.all
  end

  def search
    @trade_pokemons = MyPokemon.where(available: true).where.not(user: current_user)
  end

  def trade
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

    def destroy
      @my_pokemon = MyPokemon.find(params[:id])
      @my_pokemon.destroy
      redirect_to my_pokemons_path
    end

  private

  def set_my_pokemon
    @my_pokemon = MyPokemon.find(params[:id])
  end
end
