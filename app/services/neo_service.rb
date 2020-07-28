class NeoService

  def daily
    get_json("daily")
  end

  def conn
    Faraday.new(url: "http://localhost:9292") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
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
