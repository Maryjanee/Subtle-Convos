class Comment < ApplicationRecord
  validates :body, :user_id, :feeling_id,  presence: true 
  belongs_to :user
  belongs_to :feeling
end