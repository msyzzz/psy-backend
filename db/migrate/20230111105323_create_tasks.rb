class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :testee_range
      t.integer :questionnaire_id
      t.integer :doctor_id
      t.string :deadline
      t.integer :total
      t.integer :finish

      t.timestamps
    end
  end
end
