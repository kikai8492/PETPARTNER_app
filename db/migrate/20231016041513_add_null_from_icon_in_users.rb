class AddNullFromIconInUsers < ActiveRecord::Migration[6.1]
  def chang
    change_column_null :users, :icon, false
  end
end
