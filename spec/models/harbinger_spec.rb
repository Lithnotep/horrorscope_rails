require 'rails_helper'

RSpec.describe Harbinger, type: :model do
  describe 'Validations' do
    # it {should validate_presence_of(:name)}
    it {should validate_presence_of(:neo_id)}
  end

  describe 'Relationships' do
    it {should have_many(:harbinger_users)}
    it {should have_many(:users).through(:harbinger_users)}
    it {should have_many(:daily_harbingers)}
    it {should have_many(:daily_messages).through(:daily_harbingers)}
  end
end
