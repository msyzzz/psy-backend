class CreateUsers < ActiveRecord::Migration[5.1]
  def change
      create_table :users do |t|
        t.string :index, limit:100, null:false, default:''
        t.index :index, unique: true
        t.string :password_digest, limit:256, null:false, default:''
        t.string :name, limit:256, null:false, default:''
        t.integer :role, default: 1, null: false, unsigned: true

        t.timestamps
      end
  end
end
