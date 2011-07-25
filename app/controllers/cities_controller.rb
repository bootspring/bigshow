class CitiesController < ApplicationController
  def show
    @events = City.find_by_name(params[:id]).events
  end
end
