class BookingsController < ApplicationController
  def new
    @event = Event.find(params[:id])
    authorize @event
    @booking = Booking.new()
  end

  def create
    raise
    @booking = Booking.new(user: current_user)
  end
end
