class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :number
      t.string :types

      t.timestamps
    end
  end
end
