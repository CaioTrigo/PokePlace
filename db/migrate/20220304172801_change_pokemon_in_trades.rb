class ChangePokemonInTrades < ActiveRecord::Migration[6.1]
  def change
    remove_column :trades, :pokemon_id
    add_reference :trades, :my_pokemon, index: true, foreign_key: true
  end
end
