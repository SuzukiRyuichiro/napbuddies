class EventsController < ApplicationController
  def new
  end

  def create
  end

  def index
    @events = Event.all
    @events = policy_scope(@events)
  end

  def show
  end

  private

  def event_params
  end
end
