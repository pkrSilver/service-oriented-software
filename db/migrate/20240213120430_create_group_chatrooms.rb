class CreateGroupChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :group_chatrooms do |t|
      t.string :name
      t.timestamps
    end
  end
end