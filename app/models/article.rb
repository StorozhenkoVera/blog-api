class Article < ApplicationRecord
  validates :title, length: { maximum: 100 }
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments
  belongs_to :user

  enum category: %i[
    science
    economics
    travels
    food
    sport
    checked_out
    psychology
  ]

  default_scope { order("created_at DESC") }

  scope :by_author, ->(user_id) {
    where(user_id: user_id)
  }

  scope :by_category, ->(category) {
    where(category: category)
  }

end