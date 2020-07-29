require 'rails_helper'

RSpec.describe HarbingerUser, type: :model do
  describe 'Relationships' do
    it {should belong_to :user}
    it {should belong_to :harbinger}
  end
end
