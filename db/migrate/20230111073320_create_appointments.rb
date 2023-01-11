class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
    
    t.references :user, null: false, foreign_key: true
    t.references :doctor, null: false, foreign_key: true
    t.references :consult, null: false, foreign_key: true
    t.timestamps
    end
  end
end
