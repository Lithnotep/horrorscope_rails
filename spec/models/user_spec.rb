require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many(:personal_messages)}
    it {should belong_to :harbinger}
  end
end
