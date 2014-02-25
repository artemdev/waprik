class Public::NewsController < ApplicationController
	layout 'mobile'

	def index
		@news = News.latest
		@title = "Новинки видео, клипов, приколов мобильного"
	end

  def show
     @related_news = @news.related_news if @news = News.find(params[:id])
  end
end
