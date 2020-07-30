class PersonalController < ApplicationController
  def show
    @user = current_user
    @message = current_user.personal_messages.first.description
    @date = current_user.personal_messages.first.description[-10..-1]

    neo_id = @user.harbingers.first.neo_id
    @harbinger = NeoSearch.new.harbinger(neo_id)
  end
end
