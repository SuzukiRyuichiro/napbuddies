class DashboardsController < ApplicationController
  def show
    @events_as_host = current_user.events_as_host
    @bookings =
  end
end
