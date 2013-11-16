# encoding: utf-8
class NewsController < ApplicationController

	layout 'mobile'

  def index
  	@news = News.sorted
  end

  def new
  	@news = News.new(:section => params[:section])
  end

  def create_news
  	@news = News.new(params[:news])
  	if @news.save
  		flash[:notice] = "Новость добавлена"
  		redirect_to(:action => "index")
  	else
  		render('new')
  	end
  end

  def translate_type( name )
    case name
      when "music"
        name = "Музыка"
      when "video"
        name = "Видео"
      when nil
        name = "Не удалось определить тип новости"
    end
    return name
  end
end
