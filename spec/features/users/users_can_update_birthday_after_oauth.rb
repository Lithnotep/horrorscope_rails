require "rails_helper"

RSpec.describe "after logging in" do
  before :each do
    @user = User.create!(name: "Dione")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  end
  it "a user can update birthday" do

    visit("/users/#{@user.id}/edit")
    expect(page).to have_content("WELCOME #{@user.name.upcase}! PLEASE ENTER YOUR BIRTHDAY TO GET YOUR PERSONALIZED READING")

    fill_in :birthday, with: "1990-05-29"
    click_on "CONTINUE"

    expect(@user.birthday).to eq("1990-05-29")
    expect(current_path).to eq(personal_path)

    # expect(page).to have_content
  end
  it "A user can add event to their calendar" do

    visit("/users/#{@user.id}/edit")

    fill_in :birthday, with: "1990-05-29"
    click_on "CONTINUE"

    expect(@user.harbingers.first).to_not eq(nil)
    expect(@user.harbingers.first.name).to_not eq(nil)
    expect(@user.personal_messages).to_not eq([])
  end
end
