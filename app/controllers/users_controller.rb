class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Input"
      render :new
    end
  end

  def show
    if current_admin?
      redirect_to admin_dashboard_path
    else
      current_user
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
