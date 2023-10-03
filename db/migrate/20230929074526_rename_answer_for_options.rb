class RenameAnswerForOptions < ActiveRecord::Migration[6.1]
  def change
    rename_column :options, :answer, :answers
  end
end
