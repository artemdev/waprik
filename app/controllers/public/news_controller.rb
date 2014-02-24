class Public::NewsController < ApplicationController
	

	def index
		@news = News.latest
	end

	def show
		@news = News.find(params[:id])
	end

end
