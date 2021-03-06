class EquipmentPolicy < ApplicationPolicy

  def show?
    true
  end

  def new?
    true
  end

  def create?
    record.user == user
  end

  def list?
    true
  end

  def destroy?
    true
  end

  def search?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
