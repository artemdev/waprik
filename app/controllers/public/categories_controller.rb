class Public::CategoriesController < ApplicationController
	layout 'mobile'
	
	def show
		@category = Category.find(params[:id])
		if params[:content_type] == "videos"
			@videos = @category.videos
		elsif params[:content_type] == "serials"
			@serials = @category.serials
		elsif params[:content_type] == "news"
			@news = @category.news			
		end
	end

end
