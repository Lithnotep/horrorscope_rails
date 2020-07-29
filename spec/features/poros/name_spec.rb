require "rails_helper"

RSpec.describe "names can generate" do
  it "makes a name" do
    name_list = Name.new
    name = name_list.get_name
    expect(name_list.names).to include(name)
  end
end
