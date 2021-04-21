class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:name].empty?
      redirect_to login_path
    else
      @user = User.find_by(name: params[:user][:name])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        session.delete :id
        redirect_to login_path
      end
    end
  end


end
