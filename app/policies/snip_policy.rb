class SnipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show?
      user.try(:admin?) || record.volt.has_member?(user)
  end
  def create?
      user.try(:admin?) || record.volt.has_manager?(user) ||
      record.volt.has_editor?(user)
  end
  def update?
      user.try(:admin?) || (record.volt.has_editor?(user) && record.author == user) || record.has_manager?(user)
  end
  def destroy?
      user.try(:admin?) || record.volt.has_manager?(user)
  end
end
