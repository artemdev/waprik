class Admin::AdminUsersController < ApplicationController
	layout 'mobile'

	before_filter :confirm_logged_in

	def index
		redirect_to(:action => 'list')
	end

  def list
  	@users = AdminUser.sorted
  end

  def show
  	@user = AdminUser.find(params[:id])
  end

  def new
  	@user = AdminUser.new
  end

  def create
  	@user = AdminUser.new(params[:user])
  	if @user.save
  		flash[:notice] = "Теперь с нами новый админ :)"
			redirect_to(:action => 'list')
  	else
  		render('new')
  	end
  end

  def edit
  	@user = AdminUser.find(params[:id])
  end

  def update
  	@user = AdminUser.find(params[:id])
  	if @user.update_attributes(params[:user])
  		flash[:notice] = "Обновлено! :)"
			redirect_to(:action => 'list')
  	else
  		render('edit')
  	end
  end

  def delete
  	@user = AdminUser.find(params[:id])
  end

  def destroy
   	AdminUser.find(params[:id]).destroy
   	flash[:notice] = "Админ успешно удален"
   	redirect_to(:action => 'list')
  end
end
