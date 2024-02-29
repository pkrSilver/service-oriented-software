class CreateCommentsSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :comments_subjects do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :post_subject, foreign_key: true

      t.timestamps
    end
  end
end