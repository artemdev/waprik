class Public::NewsController < ApplicationController
	layout 'mobile'

	def index
		@news = News.latest
	end

  def show
     @related_news = @news.related_news if @news = News.find(params[:id])
  end
end
