class Feeling < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  validates :body, presence: true
end
