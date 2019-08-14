class TagPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, tag)
    @user = user
    @tag = tag
  end

  def index?
    true if site_admin?
    true unless @user.nil?
  end

  def show?
    true if site_admin?
    @tag.user == @user && !@user.nil?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if site_admin?
      scope.where(user_id: @user.id)
    end
  end
end
