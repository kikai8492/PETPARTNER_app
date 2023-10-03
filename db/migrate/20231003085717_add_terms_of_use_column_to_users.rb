class AddTermsOfUseColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :terms_of_use, :string
  end
end
