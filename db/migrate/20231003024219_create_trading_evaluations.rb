class CreateTradingEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :trading_evaluations do |t|
      t.text :feedback, null: false
      t.integer :score, null: false
      t.bigint :user_id, null: false
      t.bigint :receive_user_id, null: false

      t.timestamps
    end
  end
end
