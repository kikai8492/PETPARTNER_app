class AddIndexAnimalsId < ActiveRecord::Migration[6.1]
  def change
    add_index :animals, :id
  end
end
