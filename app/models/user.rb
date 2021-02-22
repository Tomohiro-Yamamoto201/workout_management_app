class User < ApplicationRecord
  validates :nickname, presence:true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
  uniqueness: { case_sensitive: false }

  has_many :training_reports, dependent: :destroy
  has_many :training_menus
  has_many :trainings

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :training_report
  
#自身とother_userが異なるなら、フォローされているユーザー情報を返す/されてなければフォロー関係を作成、保存する。
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

#フォローされており、relationship が存在すればフォローを外す。
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

#フォローしている User 達を取得し、other_user が含まれていないかを確認する。
  def following?(other_user)
    self.followings.include?(other_user)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  これは１つの画像ファイルを添付するためのもので、複数ファイルを添付したい場合はhas_many_attached :imagesとします。
  has_one_attached :image
        
end
