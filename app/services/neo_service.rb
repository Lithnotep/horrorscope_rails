class NeoService

  def daily
    get_json("daily")
  end

  def conn
    Faraday.new('https://stark-ravine-66155.herokuapp.com')
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_json_params(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

end
