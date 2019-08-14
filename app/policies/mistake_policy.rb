class MistakePolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, mistake)
    @user = user
    @mistake = mistake
  end

  def index?
    true if site_admin?
    true unless @user.nil?
  end

  def show?
    true if site_admin?
    @mistake.user == @user && !@user.nil?
  end

  def create?
    index?
  end

  def new?
    create?
  end

  def update?
    show?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def add_reflection?
    edit?
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
