class DailyController < ApplicationController
  def index
    @neos = NeoSearch.new.daily_neos

  end
end
