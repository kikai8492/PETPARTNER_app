class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true, null: false
      t.references :animal, null: false, foreign_key: true, null: false

      t.timestamps
    end
  end
end
