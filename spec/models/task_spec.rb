require "rails_helper"

RSpec.describe Task, type: :model do
  describe 'Relationships' do
    it {should belong_to(:user)}
  end
end
