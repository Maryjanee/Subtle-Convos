class User < ApplicationRecord
  has_many :feelings, dependent: :destroy
  has_many :followings
  has_many :followers , through: :followings
  validates :name , presence: true
end
