class UsersController < ApplicationController


  def new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to new_user_path, alert: "Password does not match confirmation"
    else
      @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to login_path
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
