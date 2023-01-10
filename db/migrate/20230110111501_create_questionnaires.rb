class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
      create_table :questionnaires do |t|
        t.string :name, null:false, default:''
        t.index :name
        t.string :description, null:false, default:''
        t.string :questions, null:false, default:''
        t.string :results, null:false, default:''
        t.integer :doctor_id

        t.timestamps
      end
    end
end
