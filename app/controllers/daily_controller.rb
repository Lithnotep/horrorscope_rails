class DailyController < ApplicationController
  def index
    @message = NeoSearch.new.daily_message
  end
end
