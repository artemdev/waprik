class Public::CategoriesController < ApplicationController
	layout 'mobile'
	
	def show
		@category = Category.find(params[:id])
		case params[:content_type]
			when "videos"
				@videos = @category.videos
			when "serials"
				@serials = @category.serials
			when "news"
				@news = @category.news			
		end
	end
end
