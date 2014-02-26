class Admin::CategoriesController < ApplicationController
	layout 'admin'

	before_filter :confirm_logged_in

	def index
		@video_categories = Category.for_videos
		@music_categories = Category.for_music
		@serials_categories = Category.for_serials
		@news_categories = Category.for_news
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			flash[:success] = "Категория успешно добавлена!"
			redirect_to(controller: 'admin/categories', action: 'index')
		else
			render 'new'
		end
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			flash[:success] = "Категория успешно обновлена"
			redirect_to(controller: 'admin/categories', action: 'index')
		else
			render 'edit'
		end
	end

	def destroy
		Category.find(params[:id]).destroy
		redirect_to admin_categories_path
	end

end
