class GroupChatUser < ApplicationRecord
  belongs_to :user
  belongs_to :group_chat
end
