class NeoService

  def daily
    get_json("daily")
  end

  def birthday(user_birthdate)
    params = {
                birthday: user_birthdate
             }
    get_json_params("birthday", params)
  end

  def harbinger(neo_id)
    params = {
                asteroid_id: neo_id
             }
    get_json_params("harbinger", params)
  end

  def conn
    Faraday.new(url: "https://stark-ravine-66155.herokuapp.com")
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
