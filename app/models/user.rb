class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :likes
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  has_many :follows

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  validates_length_of :nickname, within: 3..20
  validates_uniqueness_of :nickname, case_sensitive: false
  validates_length_of :description, maximum: 140
  validate :avatar_size

  protected

    def avatar_size
      errors.add(:avatar, 'cannot exceed 1 megabyte') if avatar.size > 1.megabyte
    end
end
