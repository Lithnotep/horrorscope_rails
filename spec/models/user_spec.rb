require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many(:personal_messages)}
    it {should have_many(:harbinger_users)}
    it {should have_many(:harbingers).through(:harbinger_users)}
  end
end
