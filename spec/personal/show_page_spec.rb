require "rails_helper"

RSpec.describe "Welcome Page" do
  it "should have landing page, log in link and todays neos" do
    visit "/personal"

  
    expect(page).to have_content("Personal Zodiac")
    expect(page).to have_content("LOG IN")
    expect(page).to have_content("HOME")
    expect(page).to have_content("Track your Harbinger of Doom")
    expect(page).to have_css(".cathulu")
    # cathulu = find(:css, ".cathulu")
    # expect(cathulu).not_to be_empty
    # expect(page).to have_content("project statement and intent")
  end
end
