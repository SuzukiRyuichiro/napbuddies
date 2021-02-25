class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.event.user == user
  end

  def new?
    true
  end

  def create?
    true
  end
end
