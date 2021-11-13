class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
  end

  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to login_path, success: t('.success')
      else
        flash.now[:danger] = t('.fail')
        render :new
      end
  end
    
  private

  def set_user
    @user = User.find(params[:id])
  end
    
  def user_params
   params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
  end
end
