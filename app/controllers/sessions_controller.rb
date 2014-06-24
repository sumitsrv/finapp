class SessionsController < ApplicationController
  skip_before_filter :logged_in?, :except => [:destroy]

  def new
  end

  def create
    session_params = params[:session]
    user = User.authenticate(session_params[:email], session_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_url, flash[:success] => "Logged in!"
    else
      flash[:error] = "Invalid email or password"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, flash[:notice] => "Logged out!"
  end
end
