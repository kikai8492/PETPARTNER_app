class ChangeScoreColumunTypeToString < ActiveRecord::Migration[6.1]
  def change
    change_column :trading_evaluations, :score, :string, null: false
  end
end
