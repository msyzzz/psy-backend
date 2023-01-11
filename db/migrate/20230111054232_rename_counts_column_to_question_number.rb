class RenameCountsColumnToQuestionNumber < ActiveRecord::Migration[5.1]
  def change
    rename_column :questionnaires, :counts, :question_number
  end
end
