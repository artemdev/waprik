class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  protected

  def confirm_logged_in
  	if signed_in?
      return true
    else
      redirect_to login_path
    end
  end

end
