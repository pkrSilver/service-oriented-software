class CreateMessagesGroupChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :messages_group_chatrooms do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :group_chatroom, foreign_key: true
      t.timestamps
    end
  end
end