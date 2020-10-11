class User < ApplicationRecord
  has_many :feelings, dependent: :destroy
  has_many :friendships
  has_many :friends ,through: :friendships
  validate :name
end
