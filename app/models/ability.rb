class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    return admin_abilities if user.admin?
  end

  def admin_abilities
    can :manage, :all
  end
end
