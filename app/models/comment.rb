class Comment < ApplicationRecord
  validates :body, :body, presence: true, length: { maximum: 100 }
  belongs_to :user
  belongs_to :feeling
end
