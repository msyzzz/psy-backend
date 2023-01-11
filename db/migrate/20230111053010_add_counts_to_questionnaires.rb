class AddCountsToQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :counts, :integer
  end
end
