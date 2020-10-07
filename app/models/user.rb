class User < ApplicationRecord
  validates :nickname, presence:true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
  uniqueness: { case_sensitive: false }

  has_many :training_reports
  has_many :training_menus
  has_many :trainings

  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
