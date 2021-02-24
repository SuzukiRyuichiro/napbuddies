class DashboardsController < ApplicationController
  def show
    @events_as_host = current_user.events_as_host
    @bookings = current_user.bookings
    authorize @events_as_host
  end
end
