class BookingsController < ApplicationController
  def new
    @event = Event.find(params[:id])
    @booking = Booking.new()
    authorize @booking
  end

  def create
    @event = Event.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.event = @event
    authorize @booking
    if @booking.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = booking_params[:status]
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to events_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:spoon, :status)
  end
end
