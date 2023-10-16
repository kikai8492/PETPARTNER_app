class RemoveNullFromIconInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :icon, true
  end
end
