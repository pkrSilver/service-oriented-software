class User < ApplicationRecord
    has_secure_password 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { maximum: 50 }
    validates :surname, presence: true, length: { maximum: 50 }
    validates :name, :surname, :email, :password, presence: true
    validates :email, presence: true,

                   uniqueness: { case_sensitive: false },

                   length: { maximum: 105 },

                   format: { with: VALID_EMAIL_REGEX }
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :group_chats, dependent: :destroy
    has_many :group_chats_subjects, dependent: :destroy
    has_many :sent_chats, class_name: 'Chat', foreign_key: 'sender_id', dependent: :destroy
    has_many :messages, dependent: :destroy
    has_many :received_chats, class_name: 'Chat', foreign_key: :recipient_id, dependent: :destroy
    has_many :group_chatroom_users
    has_many :group_chatrooms, through: :group_chatroom_users
    
    def chats_with(user)
      Chat.between(self, user)
    end
    
    def chats
      Chat.where(id: sent_chats.pluck(:id) + received_chats.pluck(:id))
    end
end
