class AddAvailableToMyPokemons < ActiveRecord::Migration[6.1]
  def change
    add_column :my_pokemons, :available, :boolean, default: false
  end
end
