class CreateLikesSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :likes_subjects do |t|
      t.references :user, foreign_key: true
      t.references :post_subjects, foreign_key: true

      t.timestamps
    end
  end
end