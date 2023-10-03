class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.integer :answer1, null: false
      t.integer :answer2, null: false
      t.integer :answer3, null: false
      t.integer :answer4, null: false
      t.integer :answer5, null: false
      t.integer :answer6, null: false
      t.integer :answer7, null: false
      t.integer :answer8, null: false
      t.integer :answer9, null: false
      t.integer :answer10, null: false
      
      t.timestamps
    end
    add_reference :options, :user, foreign_key: true
  end
end
