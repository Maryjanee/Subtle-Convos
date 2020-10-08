class User < ApplicationRecord
  has_many :feelings
  validate :name
end
