require 'rails_helper'

RSpec.describe DailyMessage, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:date)}
  end

  describe 'Relationships' do
    it {should have_many(:daily_harbingers)}
    it {should have_many(:harbingers).through(:daily_harbingers)}
  end
end
