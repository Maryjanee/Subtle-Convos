class User < ApplicationRecord
  has_many :feelings, dependent: :destroy
  validates :name , presence: true
end
