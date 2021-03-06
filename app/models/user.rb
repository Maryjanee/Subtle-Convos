class User < ApplicationRecord
  has_many :feelings, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :full_name, presence: true

  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :relationships, source: :followed

  has_many :reverse_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :comments, dependent: :destroy
  has_many :feelings, foreign_key: :author_id, dependent: :destroy
  has_one_attached :photo
  has_one_attached :cover_image
end
