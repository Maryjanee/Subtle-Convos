class User < ApplicationRecord
  has_many :feelings, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :relationships, source: :followed

  has_many :reverse_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followers, through: :reverse_relationships, source: :follower

  has_one_attached :avatar
  has_one_attached :cover_image

end
