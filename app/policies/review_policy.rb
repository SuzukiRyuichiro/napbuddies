class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    # you can write a review if current_user have been in User.find(params[:id])'s event or vice versa
    User.find(params[:id]).events_as_host.bookings.any? { |booking| booking.user == current_user } || current_user.events_as_host.bookings.any? { |booking| booking.user == User.find(params[:id]) }
  end
end
