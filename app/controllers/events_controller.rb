class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def index
    if params[:query].present?
      @events = Event.search_by_title_and_description(params[:query])
    else
      @events = Event.all
    end
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url('noun_hug_146406.svg')
      }
    end
    @events = policy_scope(@events)
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.user
    authorize @event
  end

  private

  def event_params
    params.require(:event).permit(:title, :location, :time, :max_guest, :host_spoon, :description, :photo)
  end
end
