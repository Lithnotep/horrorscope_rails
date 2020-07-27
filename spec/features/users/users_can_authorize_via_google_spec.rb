require "rails_helper"

RSpec.describe "when visiting the home page" do
  it "a user can log in via oauth" do
    visit "/"
    click_on "LOG IN"
    expect(current_path).to eq("/user_info")
    expect(page).to have_content("Welcome! Please enter you name and birthday for your personalized readings")
  end
end
