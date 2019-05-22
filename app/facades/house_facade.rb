class HouseFacade
  def initialize(house)
    @house = house.downcase
  end

  def total_count
    slytherin.count
  end

  def slytherin
    conn = Faraday.new("http://hogwarts-it.herokuapp.com/api/v1/house/#{@house}") do |f|
      f.params[:api_key] = ENV['YOUR_KEY_HERE']
      f.adapter Faraday.default_adapter
    end

    response = conn.get

    data =JSON.parse(response.body, symobolize_name: true)
    students = data['data'][0]['attributes']['students']
  end
end
