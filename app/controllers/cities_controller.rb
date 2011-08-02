class CitiesController < ApplicationController
  def index
    redirect_to '/sf'
  end

  def show
    @cities = City.all
    @events = City.find_by_name(params[:id]).events
  end
end
