class DeleteReferencesFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :rooms, :users
  end
end
