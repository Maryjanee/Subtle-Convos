class Feeling < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :text, presence: true
  has_many :comments
end
