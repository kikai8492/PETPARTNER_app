class RemoveUserIdFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :user_id, :bigint
  end
end
