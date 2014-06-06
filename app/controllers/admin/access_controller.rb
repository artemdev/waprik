class Admin::AccessController < ApplicationController
  layout 'admin'
	
  before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def index
    redirect_to(action: 'menu')
	end

  def login
  	redirect_to(action: 'menu') if cookies[:remember_token]
  end

  def attempt_login
  	authorized_user = AdminUser.authenticate(params[:username], params[:password])
  	if authorized_user
  		cookies.permanent[:remember_token] = authorized_user.remember_token
  		flash[:notice] = "Успех!"
  		redirect_to(action: 'menu')
  	else
  		flash[:notice] = "Неверный логин или пароль :("
  		redirect_to(action: 'login')
  	end
  end

  def menu
  end

  def logout
  	cookies.delete(:remember_token)
  	flash[:notice] = "Выход спешен :)"
		redirect_to(action: 'login')
  end
end
