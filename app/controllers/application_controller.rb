class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery

  protected

  def admin?
    true if current_user && current_user.admin?
  end

  def confirm_logged_in!
  	if signed_in?
      return true
    else
      redirect_to login_path
    end
  end

end
