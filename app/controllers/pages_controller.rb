class PagesController < ApplicationController
  def show
    expires_in 1.hour, :public => true
    render :action => params[:page]
  end
end
