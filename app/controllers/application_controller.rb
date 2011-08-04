class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_cities

  def load_cities
    @cities = City.all
  end
end
