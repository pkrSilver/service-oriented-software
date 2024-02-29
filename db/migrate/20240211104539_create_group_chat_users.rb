class CreateGroupChatUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :group_chat_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :group_chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
