class AddReferencesToRoom < ActiveRecord::Migration[6.1]
  def change
    add_reference :trading_evaluations, :room, foreign_key: true
  end
end
