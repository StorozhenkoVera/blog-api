class User < ApplicationRecord
  validates :name, presence: true
  has_many :chat_rooms, dependent: :destroy
end
