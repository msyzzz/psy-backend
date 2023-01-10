class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :questionnaire_id
      t.string :details

      t.timestamps
    end
  end
end
