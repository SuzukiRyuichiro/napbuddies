class EventsController < ApplicationController
  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def index
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :time, :max_guest)
  end
end
