class Comment < ApplicationRecord
  validates :comment, length: { maximum: 1000 }
  validates :comment, presence: true

  belongs_to :user
  belongs_to :article
end