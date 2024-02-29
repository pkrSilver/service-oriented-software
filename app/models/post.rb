class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group_chat
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :content, presence: true
end