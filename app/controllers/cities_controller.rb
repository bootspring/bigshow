class CitiesController < ApplicationController

  def index
    redirect_to '/sf'
  end

  def show
    render :status => 400, :nothing => true and return if params[:id].blank? 
    city_id = supported_cities[params[:id]]
    render :status => 404, :nothing => true and return unless city_id
    @events = Event.latest.in_city(city_id)
  end

  def supported_cities
    Rails.cache.fetch('supported_cities', :expires_in => 1.hour) do
      rows = City.connection.select_rows("select id, name from cities")
      rows.inject({}) { |memo, (id, name)| memo[name] = id; memo }
    end
  end
end
