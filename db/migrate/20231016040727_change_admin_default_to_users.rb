class ChangeAdminDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :admin, from: false, to: true
  end
end
