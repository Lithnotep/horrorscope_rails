class DailyController < ApplicationController
  def index
    @neos = NeoSearch.new.daily_neos
    binding.pry
  end
end
