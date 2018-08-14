class BookingPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
    # if user == @record.user
    #   return false
    # else
    #   return true
    # end
  end

  def show?
    user == record.user
  end

  def index?
    user == record.user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
