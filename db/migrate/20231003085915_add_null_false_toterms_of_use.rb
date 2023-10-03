class AddNullFalseTotermsOfUse < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :terms_of_use, :string ,null: false
  end
end
