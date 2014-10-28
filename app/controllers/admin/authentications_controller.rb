class Admin::AuthenticationsController < ApplicationController

  def to_vk
  	session[:state] = Digest::MD5.hexdigest(rand.to_s)
		redirect_to VkontakteApi.authorization_url(scope: [:wall], state: session[:state])
  end

  def from_vk
  	vk_code = params[:code] if params[:code].present?
  	# redirect_to login_url, alert: 'Ошибка авторизации' if params[:state] != session[:state]
  	if User.find_by_vk_code(vk_code)
			message = "vk_code уже используется"
		else
	  	vk = VkontakteApi.authorize(code: vk_code)
			# и теперь можно вызывать методы API на объекте @vk
			current_user.vk_access_token = vk.token
			current_user.vk_user_id = vk.user_id
			current_user.vk_code = vk_code
			current_user.save(validate: false)			
			message = "получен token #{vk.token}, id #{vk.user_id}"
		end
		flash[:success] = message
		redirect_to root_path
  end
end
