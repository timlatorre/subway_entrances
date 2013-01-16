class HomeController < ApplicationController

  def index
  end

  def create
    html = HTTParty.get('http://data.cityofnewyork.us/api/views/drex-xx56/rows.json')
    json = JSON(html.body)

    json['data'].each do |entrance|
      lat = entrance[9][1].to_f
      long = entrance[9][2].to_f
      line = entrance[10]
      name = entrance[12]
      Subway.create(:lat => lat, :long => long, :line => line, :name => name)
    end
    redirect_to root_path
  end

  def show
  end

  def search
  end

end