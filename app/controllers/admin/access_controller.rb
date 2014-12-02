class Admin::AccessController < ApplicationController
  layout 'admin'
	
  before_filter :confirm_logged_in!, :except => [:login, :attempt_login, :logout]
  before_filter :admin?
  
	def index
    redirect_to action: 'menu'
	end

  def login
  	redirect_to action: 'menu' if current_user
  end

  def attempt_login
  	authorized_user = User.authenticate(params[:username], params[:password])
  	if authorized_user
  		sign_in authorized_user
  		flash[:notice] = "Успех!"
  		redirect_to action: 'menu'
  	else
  		flash[:notice] = "Неверный логин или пароль :("
  		redirect_to(action: 'login')
  	end
  end

  def menu
  end

  def logout
    sign_out
  	flash[:notice] = "Выход спешен :)"
		redirect_to action: 'login'
  end
end
