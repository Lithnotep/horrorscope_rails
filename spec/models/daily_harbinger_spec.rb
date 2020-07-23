require 'rails_helper'

RSpec.describe DailyHarbinger, type: :model do
  describe 'Relationships' do
    it {should belong_to(:daily_message)}
    it {should belong_to(:harbinger)}
  end
end
