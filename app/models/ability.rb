# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all

    cannot :destroy, Event
    can :destroy, Event, creator: user
    cannot :destroy, Club
    can :destroy, Club, creator: user
    cannot [:create, :destroy], Website
    cannot [:create, :edit, :destroy], Book
    cannot [:create, :edit, :destroy, :instruction, :backyard], News
    cannot :manage, User
    can :show, User
    can [:edit, :update], User, id: user.id

    if user.is_collaborator?
      can [:edit, :backyard], News
    end

    if user.is_moderator?
      can :destroy, Event
      can :destroy, Club
      can [:create, :destroy], Website
      can [:create, :edit, :destroy], Book
      can :destroy, News, category: 0
      can [:create, :instruction], News
      can [:index, :upgrade, :downgrade], User
    end
  end
end
