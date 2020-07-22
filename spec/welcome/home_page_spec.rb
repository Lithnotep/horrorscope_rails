require "rails_helper"

RSpec.describe "Welcome Page" do
  it "should have landing page, log in link and todays neos" do
    visit "/"

    expect(page).to have_content("WELCOME TO HORROR SCOPES")
    expect(page).to have_content("TODAYS TRAGEDY AS PREDICTED BY THE PLANETS")
    expect(page).to have_css("img[src*='logos/whiter_cathulu.png']")
    expect(page).to have_content("project statement and intent")
  end
end
