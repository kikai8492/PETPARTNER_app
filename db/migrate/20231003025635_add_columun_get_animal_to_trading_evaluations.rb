class AddColumunGetAnimalToTradingEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :trading_evaluations, :get_animal, :integer, null: false
  end
end
