class CreateGroupChatroomUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :group_chatroom_users do |t|
      t.references :user, foreign_key: true
      t.references :group_chatroom, foreign_key: true
      t.timestamps
    end
  end
end