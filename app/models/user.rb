class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates_length_of :nickname, within: 3..20
  validates_uniqueness_of :nickname, case_sensitive: false
  validate :avatar_size

  protected

    def avatar_size
      errors.add(:avatar, 'cannot exceed 1 megabyte') if avatar.size > 1.megabyte
    end
end
