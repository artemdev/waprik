module SessionsHelper


	def current_user
		@current_user ||= AdminUser.find_by_remember_token(cookies[:remember_token])
	end
	
end