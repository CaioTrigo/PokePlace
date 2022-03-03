class PagesController < ApplicationController
  def home
  end

  def profile
    @pokemon.name
  end
end
