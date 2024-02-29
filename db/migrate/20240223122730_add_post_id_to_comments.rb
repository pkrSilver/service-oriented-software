class AddPostIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments_subjects, :posts_subject_id, :integer
  end
end