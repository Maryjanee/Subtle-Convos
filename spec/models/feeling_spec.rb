require 'rails_helper'

RSpec.describe Feeling, type: :model do
  describe 'Association' do
    it { should belong_to(:author) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:text) }
  end
end
