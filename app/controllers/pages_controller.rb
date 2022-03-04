class PagesController < ApplicationController
  def home
    redirect_to my_pokemons_path if user_signed_in?
  end

  def profile
    @pokemon.name
  end
end
