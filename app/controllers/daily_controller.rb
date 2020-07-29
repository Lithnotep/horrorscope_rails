class DailyController < ApplicationController
  def index
    @events = NeoSearch.new.daily_neos
  end
end
