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
    cannot [:create, :edit, :destroy, :instruction], News

    if user.is_collaborator?
      can :edit, News
    end

    if user.is_moderator?
      can :destroy, Event
      can :destroy, Club
      can [:create, :destroy], Website
      can [:create, :edit, :destroy], Book
      can :destroy, News, category: 0
      can [:create, :instruction], News
    end
  end
end
