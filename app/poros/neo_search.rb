class NeoSearch

  def daily_data
    NeoService.new.daily
  end

  def birthday_data(birthdate)
    NeoService.new.birthday(birthdate)
  end

end
