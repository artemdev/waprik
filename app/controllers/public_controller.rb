# РАБОТА С ОТКРЫТОЙ ДЛЯ ВСЕХ ЧАСТЬЮ САЙТА
# Музыка /music
# Видео /video

class PublicController < ApplicationController

  layout 'mobile'

	 before_filter :find_category, :only => ['list']

  def index
  	@categories = Category.sorted
    @collections = Collection.top
    @section = "video"
    @last_news = News.sorted.where(:section => @section).last
  end

  def category
    @category = Category.find(params[:id])
      # Палингация
      @first_page = 1
      @current_page =  if params[:page].to_i > 0; params[:page].to_i; else @first_page; end
      @limit = 5
      @previous_page = @current_page - 1
      @offset = if @current_page == @first_page; 0; else @previous_page * @limit; end;
      @videos = Video.sorted.where(:category_id => @category.id).limit(@limit).offset(@offset)
      @next_page = @current_page + 1
      @last_page = @videos.size / @limit
  end

  def show
    @video = Video.find(params[:id])
    @categories = @video.categories
  end

  def download # Скачивание видео
    @video = Video.find(params[:id])
    version = params[:version]
    case version
      when '3gp'
        @video.downloads += 1
        @video.save
        link = @video.low_3gp.url
      when 'mp4_176'
        @video.downloads += 1
        @video.save
        link = @video.mp4_176.url
      when 'mp4_320'
        @video.downloads += 1
        @video.save
        link = @video.mp4_320.url
    end
    redirect_to(link)
  end

### КОЛЛЕКЦИИ ВИДЕО (ПОДБОРКИ) ###

  def collection
    @collection = Collection.find(params[:collection_id])
  end

  def go_to_main_page
    redirect_to('http://waprik.ru')
  end

  private

  def find_category
  	if params[:category_id]
  		@category = Category.find(params[:category_id])
  	end
  end

end
