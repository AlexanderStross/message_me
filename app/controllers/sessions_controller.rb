class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Login successful'
      redirect_to root_path
    else
      flash.now[:error] = 'There was something wrong with your login credentials'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You are logged out'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:notice] = 'Log in or create an account to start chatting'
      redirect_to root_path
    end
  end
end
