class Admin::AdminUsersController < ApplicationController
	before_filter :confirm_logged_in
  
  layout 'admin'

	def index
		redirect_to(:action => 'list')
	end

  def list
  	@users = User.sorted
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:notice] = "Теперь с нами новый админ :)"
			redirect_to(:action => 'list')
  	else
  		render('new')
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:notice] = "Обновлено! :)"
			redirect_to(:action => 'list')
  	else
  		render('edit')
  	end
  end

  def delete
  	@user = User.find(params[:id])
  end

  def destroy
   	User.find(params[:id]).destroy
   	flash[:notice] = "Админ успешно удален"
   	redirect_to(:action => 'list')
  end
end
