class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery
  
  protected

  def confirm_logged_in
  	unless cookies[:remember_token]
  		flash[:notice] = "Please, log in"
  		redirect_to(:controller => 'admin/access', :action => 'login')
  		return 'false'
  	else
  		return true
  	end
  end

end
