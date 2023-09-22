class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.integer :pet_type, null: false
      t.string :pet_name, null: false
      t.integer :sex, null: false
      t.integer :age, null: false
      t.integer :vaccinated, null: false
      t.integer :spayed_neutered, null: false
      t.text :note, null: false
      t.integer :prefecture, null: false
      t.integer :trading_status, null: false, default: 0


      t.timestamps
    end
  end
end
