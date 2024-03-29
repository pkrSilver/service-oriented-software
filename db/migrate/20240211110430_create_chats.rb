class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :other_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :chats, [:user_id], unique: true
  end
end
