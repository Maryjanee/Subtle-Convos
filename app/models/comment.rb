class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 100 }
  belongs_to :author, class_name: 'User'
  belongs_to :feeling
end
