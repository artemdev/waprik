class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  # before_filter :redirect_web_users

  protected

  def admin?
    true if current_user && current_user.admin?
  end

  # def redirect_web_users
  # end

  def confirm_logged_in!
  	if signed_in?
      return true
    else
      redirect_to login_path
    end
  end

end
