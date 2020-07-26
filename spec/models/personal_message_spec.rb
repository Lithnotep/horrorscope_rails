require 'rails_helper'

RSpec.describe PersonalMessage, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:date)}
  end

  describe 'Relationships' do
    it {should belong_to :user}
  end
end
