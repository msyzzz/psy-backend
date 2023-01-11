class CreateConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :consults do |t|
      t.string :time
      t.string :place
      t.boolean :has_reserved
      
      t.timestamps
    end
  end
end
