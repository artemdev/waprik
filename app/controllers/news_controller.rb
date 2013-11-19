# encoding: utf-8
class NewsController < ApplicationController

	layout 'mobile'
  before_filter :confirm_logged_in
  before_filter :find_news_section, :only => ['index', 'show']

  def index # Просмотр последних новостей
    if @last_news = News.sorted.where(:section => @section).last
      @related_news = @last_news.related_news
    end
  end

  def show
    @item = News.find(params[:item_id])
  end

  def new # Создание новости (Шаг 1)
  	@news = News.new(:section => params[:section])
    @sections = ['@news.section']
  end

  def create_news # Создание новости (Шаг 2)
  	@news = News.new(params[:news])
  	if @news.save
  		flash[:notice] = "Новость добавлена"
  		redirect_to(:action => "index")
  	else
  		render('new')
  	end
  end

  private

  def find_news_section
    @section = params[:section]
  end

end
