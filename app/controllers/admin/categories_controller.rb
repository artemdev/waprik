class Admin::CategoriesController < ApplicationController
	layout 'admin'

	before_filter :confirm_logged_in

	def index
		@video_categories = Category.for_video
		@music_categories = Category.for_music
		@serials_categories = Category.for_serials
		@video_news = Category.for_news
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			flash[:success] = "Категория успешно добавлена!"
			redirect_to(controller: 'admin/categories', action: 'show', id: @category.id)
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
			redirect_to action: 'show', id: @category.id
		else
			render 'edit'
		end
	end

end
