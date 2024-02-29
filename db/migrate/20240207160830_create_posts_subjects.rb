class CreatePostsSubjects < ActiveRecord::Migration[6.0] # adjust the version if needed
  def change
    create_table :posts_subjects do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :group_chats_subject, foreign_key: true
      t.timestamps
    end
  end
end