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
end