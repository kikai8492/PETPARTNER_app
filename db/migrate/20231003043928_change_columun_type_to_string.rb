class ChangeColumunTypeToString < ActiveRecord::Migration[6.1]
  def change
    change_column :trading_evaluations, :get_animal, :string, null: false
  end
end
