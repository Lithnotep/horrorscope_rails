require "rails_helper"

RSpec.describe "Welcome Page" do
  before :each do
    @user = User.create!(name: "Madeleine", points: 5)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit("/users/#{@user.id}/edit")

    fill_in :birthday, with: "1990-05-29"

    click_on "CONTINUE"
  end

  it "should have landing page, log in link and todays neos" do

    visit "/personal"
    expect(page).to have_content("THE HARBINGER OF YOUR BIRTH")
    expect(page).to have_content("LOG OUT")
    expect(page).to have_content("HOME")
    expect(page).to have_content("ON THE DAY OF YOUR BIRTH #{@user.harbingers.first.name.upcase}")
    expect(page).to have_css(".cathulu-personal")
  end

  it "should have landing page, log in link and todays neos but gain no points" do

    visit "/personal"
    expect(@user.points).to eq(5)
    expect(page).to have_content("THE HARBINGER OF YOUR BIRTH")
    expect(page).to have_content("LOG OUT")
    expect(page).to have_content("HOME")
    expect(page).to have_content("ON THE DAY OF YOUR BIRTH ")
    expect(page).to have_css(".cathulu-personal")
  end

  it "should have landing page, and see change fate and click it to change fate" do

    visit "/personal"
    expect(@user.points).to eq(5)
    expect(page).to have_content("THE HARBINGER OF YOUR BIRTH")
    expect(page).to have_content("LOG OUT")
    expect(page).to have_content("HOME")
    expect(page).to have_content("ON THE DAY OF YOUR BIRTH ")
    expect(page).to have_css(".cathulu-personal")
    click_on "ALTER YOUR FATE"
    expect(@user.points).to eq(5)
  end

end
