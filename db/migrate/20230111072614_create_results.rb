class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :name
      t.integer :score
      t.string :details
      t.integer :questionnaire_id
      t.integer :user_id

      t.timestamps
    end
  end
end
