class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
  belongs_to :user
  has_many :messages, dependent: :destroy

    
  scope :between, ->(sender, recipient) do
    where(sender: sender, recipient: recipient).or(where(sender: recipient, recipient: sender))
  end

  def self.create_between(sender, recipient)
    chat = Chat.between(sender, recipient).first
    return chat if chat

    create(sender: sender, recipient: recipient, user: sender)
  end
end