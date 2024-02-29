class CreateGroupChatsSubjectsUsers < ActiveRecord::Migration[6.0] # or your Rails version
  def change
    create_table :group_chats_subjects_users, id: false do |t|
      t.references :user, foreign_key: true
      t.references :group_chat_subjects, foreign_key: true
    end
  end
end