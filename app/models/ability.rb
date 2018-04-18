class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can :read, :all .
    if user.present?
      can :manage, Post, id: user.id
      if user.admin?
        can :manage, :all
      end
    end
  end
end
