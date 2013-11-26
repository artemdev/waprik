# encoding: utf-8
class NewsController < ApplicationController

	layout 'mobile'
  before_filter :confirm_logged_in
  before_filter :find_news_section, :only => ['index', 'show']

  def index # Просмотр последних новостей
    @related_news = @last_news.related_news if @last_news = News.sorted.where(:section => @section).last
  end

  def show # Показ
     @related_news = @item.related_news if @item = News.find(params[:id])
  end

  def new # Создание (Шаг 1)
  	@news = News.new(:section => params[:section])
    @sections = ['@news.section']
  end

  def create # Создание (Шаг 2)
  	@news = News.new(params[:news])
  	if @news.save
  		flash[:notice] = "Новость добавлена"
  		redirect_to(:action => "index")
  	else
  		render('new')
  	end
  end

  def edit # Редактирование (Шаг 1)
    @item = News.find(params[:id])
    @sections = ['@news.section']
  end

  def update # Редактирование (Шаг 2)
    @item = News.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Новость обновлена"
      redirect_to(:action => 'show', :id => @item.id, :section => @item.section)
    else
      render('edit')
    end
  end

  def destroy # Удаление
    @item = News.find(params[:id]).destroy
    flash[:notice] = "Новость \"#{@item.description}\" удалена"
    redirect_to(:action => 'index')
  end

  private

  def find_news_section
    @section = params[:section]
  end

end
