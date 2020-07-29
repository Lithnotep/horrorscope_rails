class NeoSearch

  def daily_data
    NeoService.new.daily
  end

  def birthday_data(birthdate)
    NeoService.new.birthday(birthdate)
  end

  def daily_neos
    data_pull = NeoService.new.daily
    data_pull.map do |neo|
      harbinger = Harbinger.create(name: neo[:name], neo_id: neo[:id])

      harbinger.events.create(
        event_date: neo[:event_date],
        relative_velocity_mph: neo[:relative_velocity],
        lunar_distance: neo[:lunar_distance],
      )
    end
  end
end
# [{"id":"54017684","name":"(2020 MX3)","event_date":"2020-07-29","relative_velocity":"19074.0279152531","lunar_distance":"9.3872449928"},
#   {"id":"3555070","name":"(2011 AU4)","event_date":"2020-07-29","relative_velocity":"16654.901947341","lunar_distance":"59.0383917494"},
#   {"id":"3776123","name":"(2017 MW7)","event_date":"2020-07-29","relative_velocity":"26618.5971530356","lunar_distance":"64.9214319657"},
#   {"id":"3512275","name":"(2010 FK)","event_date":"2020-07-29","relative_velocity":"16167.978790533","lunar_distance":"86.3060803256"}]
