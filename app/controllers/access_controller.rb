# encoding: utf-8
class AccessController < ApplicationController

	layout 'mobile'

	before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

	def index
    redirect_to(:action => 'menu')
	end

  def login
  	redirect_to(:action => 'menu') if session[:user_id] != nil
  end

  def attempt_login
  	authorized_user = AdminUser.authenticate(params[:username], params[:password])
  	if authorized_user
  		session[:user_id] = authorized_user.id
   		session[:username] = authorized_user.username
  		flash[:notice] = "Успех!"
  		redirect_to(:action => 'menu')
  	else
  		flash[:notice] = "Неверный логин или пароль :("
  		redirect_to(:action => 'login')
  	end
  end

  def menu
  end

  def logout
  	session[:user_id] = nil
   	session[:username] = nil
  	flash[:notice] = "Выход спешен :)"
		redirect_to(:action => 'login')
  end
end
