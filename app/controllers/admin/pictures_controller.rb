class Admin::PicturesController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  

  layout 'admin'
	def index
		@pictures = Picture.erotic.latest
	end

	def show
		@picture = Picture.find(params[:id])
	end

	def new
		@picture = Picture.new
	end

	def parse_ero
		@pictures = Picture.parse_ero
	end

	def create
		@picture = Picture.new(params[:picture])
		if @picture.save
			flash[:success] = "Картинка добавлена"
			redirect_to admin_pictures_path
		else
			render 'new'
		end
	end

	def destroy
		Picture.find(params[:id]).destroy
		flash[:success] = "Картинка удалена"
		redirect_to :back
	end

end

