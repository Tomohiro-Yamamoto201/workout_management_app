class TrainingReport < ApplicationRecord
  belongs_to :user
  has_many :liked_users, through: :likes, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
