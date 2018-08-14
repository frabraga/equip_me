class EquipmentPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
