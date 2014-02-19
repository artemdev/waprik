class Admin::NewsController < ApplicationController
	layout 'mobile'
  before_filter :confirm_logged_in
  before_filter :find_news_section, :only => ['index', 'show', 'new', 'list', 'destroy', 'create']

  def index # Просмотр последних новостей
    @related_news = @last_news.related_news if @last_news = News.sorted.where(:section => @section).last
    @video_suggestions = Collection.where(hit: true, with_videos: true).order("updated_at ASC").limit(5)
    @music_suggestions = Collection.where(hit: true, with_music: true).order("updated_at ASC")
  end


  def show # Показ
     @related_news = @item.related_news if @item = News.find(params[:id])
  end

  def new # Создание (Шаг 1)
  	@news = News.new(:section => @section)
    @sections = [] 
  end

  def create # Создание (Шаг 2)
  	@news = News.new(params[:news])
  	if @news.save
  		flash[:notice] = "Новость добавлена"
  		redirect_to(action: 'list', section: @section)
  	else
  		render('new')
  	end
  end

  def edit # Редактирование (Шаг 1)
    @item = News.find(params[:id])
    @sections = ['@news.section']
  end

  def update # Редакт
    @item = News.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Новость обновлена"
      redirect_to(:action => 'show', :id => @item.id, :section => @item.section)
    else
      render('edit')
    end
  end

  def list
    @news = News.sorted.where(section: @section)
  end

  def destroy # Удаление
    @item = News.find(params[:id]).destroy
    flash[:notice] = "Новость \"#{@item.description}\" удалена"
    redirect_to(:action => 'list', section: @section)
  end

  private

  def find_news_section
    @section = params[:section]
  end
end
