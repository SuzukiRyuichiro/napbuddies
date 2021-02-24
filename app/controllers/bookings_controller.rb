class BookingsController < ApplicationController
  def new
    @event = Event.find(params[:id])
    authorize @event
    @booking = Booking.new()
  end

  def create
    @event = Event.find(params[:id])
    authorize @event
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event
    if @booking.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:spoon)
  end
end
