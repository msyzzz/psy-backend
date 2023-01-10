class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :user_type
      t.string :department

      t.timestamps
    end
  end
end
