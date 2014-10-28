class Public::VideosController < ApplicationController
  layout 'mobile'

	before_filter :find_category, :only => ['list', 'show']

  def index
  	@categories = Category.for_videos.sorted
    @collections = Collection.with_videos.hits
    @section = "video"
    @last_news = News.sorted.where(:section => @section).last
    @today_videos = Video.today
  end

  def category
    @category = Category.find(params[:id])
    @videos = @category.videos.latest.paginate(page: params[:page], per_page: 5)
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
      when 'mp4_320'
        @video.downloads += 1
        @video.save
        link = @video.mp4_320.url
      when 'mp4_640'
        @video.downloads += 1
        @video.save
        link = @video.mp4_640.url
    end
    redirect_to(link)
  end

	# Новости
  def news
    @related_news = @last_news.related_news if @last_news = News.sorted.where(:section => @section).last
    @video_suggestions = Collection.where(hit: true, with_videos: true).order("updated_at ASC").offset(5)
    @music_suggestions = Collection.where(hit: true, with_music: true).order("updated_at ASC").offset(5)
  end

	# Подборки
  def collection
    @collection = Collection.find(params[:collection_id])
  end

  def go_to_main_page
    redirect_to('http://waprik.ru')
  end

  def test
    @videos = Video.all
  end

  private

  def find_category
  	if params[:category_id]
  		@category = Category.find(params[:category_id])
  	end
  end
end
