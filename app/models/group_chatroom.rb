class GroupChatroom < ApplicationRecord
  has_many :group_chatroom_users, dependent: :destroy
  has_many :users, through: :group_chatroom_users
  has_many :messages_group_chatrooms, dependent: :destroy
end