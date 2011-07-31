class CitiesController < ApplicationController
  def index
    redirect_to '/sf'
  end

  def show
    @events = City.find_by_name(params[:id]).events
  end
end
