class UsersController < ApplicationController
  before_action :set_user, except: [:index]
  before_action :authenticate_user!, except: [:show]
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

  def show
  end

  def edit
  end

  def update
    @user.update(name: params[:user][:name], url: params[:user][:url])
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
