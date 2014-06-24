class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  add_flash_types :success, :info, :warning, :danger

  before_filter :logged_in?

  def link_to(name, url)
    ActionController::Base.helpers.link_to(name, url);
  end

  def link_to_async(name, url)
    ActionController::Base.helpers.link_to(name, url, :remote => true);
  end
  
  def flatten_date_array hash
    [1,2,3].map { |e| hash["dt(#{e}i)"].to_i }
  end

  def logged_in?
    if current_user.present?
      return true
    else
      flash[:warning] = 'Kindly Login to Continue!'
      redirect_to root_url
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
