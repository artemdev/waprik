class Public::AuthenticationsController < ApplicationController

	def create
		hash = request.env["omniauth.auth"]
		# найти если юзер авторизирован
		if current_user
			current_user.authentications.find_or_create_by_provide_and_uid(provider: hash[:provider], uid: hash[:uid])
			flash[:success] = "Вы успешно вошли"
			redirect_to account_users_url
		else
			# создать юзера если его нет
			flash[:success] = "Пожалуйста, заполните необходимые поля"
			redirect_to new_user_url 
		end

	end

end
