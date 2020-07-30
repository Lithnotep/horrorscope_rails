class PersonalController < ApplicationController
  def show
    @user = current_user
    neo_id = @user.harbingers.first.neo_id
    @harbinger = NeoSearch.new.harbinger(neo_id)
  end
end
