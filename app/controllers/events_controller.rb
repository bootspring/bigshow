class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.city_id = 1
    @event.start_at = 3.days.from_now
    @event.stop_at = 3.days.from_now
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to :new, :info => 'Event submitted, thanks!'
    else
      render :new
    end
  end

  def approve
    @event = Event.find(params[:id])
    @event.approve!
    redirect_to "/#{@event.city.name}"
  end

end
