require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    it { should belong_to(:author) }
    it { should belong_to(:feeling) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(100) }
  end
end
