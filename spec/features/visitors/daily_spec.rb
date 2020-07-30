require 'rails_helper'

RSpec.describe 'visitor can visit daily horrorscope page' do
  it 'and see what possibilities await' do
    visit '/daily'

    expect(page).to have_content('DAILY DARKNESS')
    expect(page).to have_content('FOUR HARBINGERS')

    within(".neos") do
      expect(page).to have_css(".daily-harbinger-info", count: 4)
      expect(page).to have_css(".neo_image", count: 4)
    end

    within(".neos", match: :first) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".velocity")
      expect(page).to have_css(".distance")
    end
  end
end
