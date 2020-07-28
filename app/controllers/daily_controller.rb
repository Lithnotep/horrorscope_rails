class DailyController < ApplicationController
  def index
    search = NeoSearch.new.daily_data
  end
end
