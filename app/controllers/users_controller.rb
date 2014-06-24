class UsersController < ApplicationController
  skip_before_filter :logged_in?, :except => [:destroy]
  before_filter :new_user?, :except => [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Signup Successfull!"
      redirect_to root_url
    else
      flash[:error] = "Error Signing Up"
      render 'users/new'
    end
  end

  def destroy
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
  
  def new_user?
    if current_user.present?
      redirect_to home_url
    end
  end
end
