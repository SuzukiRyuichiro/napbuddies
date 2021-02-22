class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    # @event = Event.new(event_params)
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    # params.require(:event).permit(:title, :location, :time, :user, :max_guest)
  end
end
