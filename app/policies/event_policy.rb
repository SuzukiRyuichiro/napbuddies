class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
    end
  end

  def create?
    true
  end
  def show?
    true
  end
end
