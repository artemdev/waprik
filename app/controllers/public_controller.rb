# РАБОТА С ОТКРЫТОЙ ДЛЯ ВСЕХ ЧАСТЬЮ САЙТА
# Музыка /music
# Видео /video

class PublicController < ApplicationController

  layout 'mobile'

	before_filter :find_category, :except => ['index']

  def index
  	@categories = Category.sorted
    @collections = Collection.top
  end

  def list
    @videos = Video.sorted.where(:category_id => @category.id)
  end

  def show
    @video = Video.find(params[:id])
    @categories = @video.categories
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
