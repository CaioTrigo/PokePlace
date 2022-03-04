class CreateMyPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :my_pokemons do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
