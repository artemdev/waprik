class Admin::CategoriesController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  
	layout 'admin'

	def index
		@video_categories = Category.for_videos.paginate(page: params[:page], per_page: 10)
		@music_categories = Category.for_music
		@serials_categories = Category.for_serials
		@news_categories = Category.for_news
	end

	def show
		@category = Category.find(params[:id])
		if params[:content_type] == "videos"
			@content = @category.videos.latest.paginate(page: params[:page], per_page: 5)
		elsif params[:content_type] == "serials"
			@content = @category.serials.latest.paginate(page: params[:page], per_page: 5)
		elsif params[:content_type] == "news"
			@content = @category.news.latest.paginate(page: params[:page], per_page: 5)
		end
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
		flash[:notice] = "Жанр успешно удален"
		redirect_to :back
	end

end
