class HogwartServices < ApplicationRecord

  def initialize(house_id)
    @house_id = house_id
  end
  def house
    get_jason(@house_id)
  end

  def houses
    get_jason
  end

  private
  def get_jason(url = nil)
    response = conn.get(url)
    data =JSON.parse(response.body, symobolize_name: true)
  end

  def conn
    Faraday.new("http://hogwarts-as-a-service.herokuapp.com/api/v1/house") do |f|
      f.params[:x_api_key] = ENV['SERVICE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
