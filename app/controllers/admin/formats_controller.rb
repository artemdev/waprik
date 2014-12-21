class Admin::FormatsController < ApplicationController
	before_filter :confirm_logged_in!
  before_filter :admin?
  
end
