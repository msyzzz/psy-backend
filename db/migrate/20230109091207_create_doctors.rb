class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.text :introduction
      t.string :legal_time

      t.timestamps
    end
  end
end
