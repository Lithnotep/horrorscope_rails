class NeoSearch

  def daily_data
    NeoService.new.daily
  end

  def birthday_data(birthdate)
    NeoService.new.birthday(birthdate)
  end

  def daily_message
    unless DailyMessage.where(date: Date.today.to_s).empty?
      return @message = DailyMessage.where(date: Date.today.to_s).first
    else
      daily_neos
    end
  end

  def daily_neos
    message = new_daily_message
    names = Name.new
    events = NeoService.new.daily
      events.map do |neo|
      harbinger = message.harbingers.create(harbinger_params(neo, names.get_name))
      harbinger.events.create(event_params(neo))
    end
    message
  end

  def harbinger(asteroid_id)
    NeoService.new.harbinger(asteroid_id)
  end

  def new_daily_message
    DailyMessage.create(description: Scope.new.description.upcase, date: Date.today.to_s)
  end

  def harbinger_params(neo, name)
    { name: name, neo_id: neo[:id] }
  end

  def event_params(neo)
    {
      event_date: neo[:event_date],
      relative_velocity_mph: neo[:relative_velocity].to_f.round(2),
      lunar_distance: neo[:lunar_distance].to_f.round(2)
    }
  end
end
