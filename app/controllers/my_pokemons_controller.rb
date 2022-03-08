class MyPokemonsController < ApplicationController

  def index
    @my_pokemons = current_user.my_pokemons.all
  end

  def search
    @trade_pokemons = MyPokemon.where(available: true).where.not(user: current_user)
  end

  def edit
    @my_trade_pokemons = MyPokemon.where(available: true).where(user: current_user)
    @other_pokemon_id = params[:id]
  end

  def update
    my_pokemon = MyPokemon.find(params[:id])
    other_pokemon = MyPokemon.find(params[:other_pokemon_id])
    my_pokemon_user = my_pokemon.user
    my_pokemon.user = other_pokemon.user
    my_pokemon.save
    raise
    other_pokemon.user = my_pokemon_user
    other_pokemon.save
    redirect_to root_path
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
end
