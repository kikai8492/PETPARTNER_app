class AddUserIdToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_reference :animals, :user, null: false, foreign_key: true
  end
end
