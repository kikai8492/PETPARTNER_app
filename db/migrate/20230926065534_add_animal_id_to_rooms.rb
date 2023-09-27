class AddAnimalIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :animal, null: false, foreign_key: true
  end
end
