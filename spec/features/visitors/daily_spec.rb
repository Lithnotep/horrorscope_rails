require 'rails_helper'

RSpec.describe 'visitor can visit daily horrorscope page' do
  it 'and see what possibilities await' do
    visit '/daily'

    expect(page).to have_content('DAILY DARKNESS')
    expect(page).to have_content('FOUR HARBINGERS')
  
  end
end
