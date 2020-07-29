class DailyController < ApplicationController
  def index
<<<<<<< HEAD
    @neos = NeoSearch.new.daily_neos
=======
    @events = NeoSearch.new.daily_neos
>>>>>>> f30fd6a4c8717139a450b5dddc76aeb6f0090aaa
  end
end
