class CreateChatbots < ActiveRecord::Migration[5.1]
  def change
    create_table :chatbots do |t|
      t.string :content
      t.boolean :from_bot
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
