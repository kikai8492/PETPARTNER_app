class ChangeDataToString < ActiveRecord::Migration[6.1]
  def change
    change_column :animals, :pet_type, :string
    change_column :animals, :sex, :string
    change_column :animals, :age, :string
    change_column :animals, :vaccinated, :string
    change_column :animals, :spayed_neutered, :string
    change_column :animals, :prefecture, :string
  end
end
