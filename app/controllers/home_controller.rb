class HomeController < ApplicationController

  def index
    @subways = []
  end

  def new
  end

  def create
    Subway.delete_all
    html = HTTParty.get('http://data.cityofnewyork.us/api/views/drex-xx56/rows.json')
    json = JSON(html.body)

    json['data'].each do |entrance|
      lat = entrance[9][1].to_f
      long = entrance[9][2].to_f
      line = entrance[12]
      name = entrance[10]
      Subway.create(:lat => lat, :long => long, :line => line, :name => name)
    end

    redirect_to root_path
  end

  def search
    @entrances = Subway.text_search(params[:query])
  end

  def lines
    @line = params[:button]
    @entrances = Subway.line_search(@line)

  end

end