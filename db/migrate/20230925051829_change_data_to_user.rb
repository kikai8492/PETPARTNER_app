class ChangeDataToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :prefecture, :string
    change_column :users, :occupation, :string
    change_column :users, :sex, :string
  end
end
