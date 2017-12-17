class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :search, :to => :read

    @user = user
    if  @user.nil?
      guest_user
    elsif @user.is_admin?
      can :manage, :all
      cannot [:update, :destroy], :roles, :ro => :true
    else
      normal_user
    end
  end

  def guest_user
    can :navigate, [:ad_users]
  end

  def normal_user
    guest_user
  end
end
