require 'rails_helper'

RSpec.describe 'visitor can visit daily horrorscope page' do
  it 'and see what possibilities await' do
    visit '/daily'

    expect(page).to have_content('Daily Darkness')
    expect(page).to have_content('Four Harbingers')
    save_and_open_page
  end
end
