class PersonalController < ApplicationController
  def show
    @user = current_user
    @horrorscope_message = @user.personal_messages.first.description
    # require "pry"; binding.pry
    @predicted_date = @user.personal_messages.first.date
    neo_id = @user.harbingers.first.neo_id
    @harbinger = NeoSearch.new.harbinger(neo_id)
  end
end
