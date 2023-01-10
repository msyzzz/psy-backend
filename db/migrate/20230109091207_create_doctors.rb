class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.text :name
      t.text :introduction
      t.string :legal_time
      t.boolean :has_reserved

      t.timestamps
    end
  end
end
