class Public::UsersController < ApplicationController
	layout 'web'

  before_filter :confirm_logged_in!, only: :account
  
  def account
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		redirect_to account_users_path
  	else
  		render :new
  	end
  end


end
