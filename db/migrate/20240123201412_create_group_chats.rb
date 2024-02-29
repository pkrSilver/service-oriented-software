class CreateGroupChats < ActiveRecord::Migration[6.0]
  def change
    create_table :group_chats do |t|
      t.string :name
      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end