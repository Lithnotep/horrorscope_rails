class PersonalController < ApplicationController
  def show
    @user = User.find_by(params[:id])
    neo_id = @user.harbingers.first.neo_id
    @harbinger = NeoSearch.new.harbinger(neo_id)
    require "pry"; binding.pry
  end
end
