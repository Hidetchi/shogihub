class UsersController < ApplicationController
  before_action :set_user, only: [:upgrade, :downgrade]
  before_action :authenticate_user!
  authorize_resource

  respond_to :html

  def index
    @users = User.page(params[:page]).per(50)
  end

  def upgrade
    current_role = @user.role || 0
    @user.update(role: current_role + 1) if current_role < 3
    redirect_to :back
  end
  
  def downgrade
    current_role = @user.role || 0
    @user.update(role: current_role - 1) if current_role > 0
    redirect_to :back
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
