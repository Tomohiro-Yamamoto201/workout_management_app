class User < ApplicationRecord
  validates :nickname, presence:true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
  uniqueness: { case_sensitive: false }

  has_many :training_reports
  has_many :training_menus
  has_many :trainings
  
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :training_report
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
