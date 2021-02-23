class EventsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.user
    authorize @event
  end

  private

  def event_params
  end
end
