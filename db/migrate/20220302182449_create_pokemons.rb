class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :number
      t.string :type_1
      t.string :type_2

      t.timestamps
    end
  end
end
