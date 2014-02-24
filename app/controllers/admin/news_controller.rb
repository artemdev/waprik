class Admin::NewsController < ApplicationController
	layout 'admin'
  before_filter :confirm_logged_in
  before_filter :find_category, :only => ['new','create']

  def index # Просмотр последних новостей
    @categories = Category.all
  end


  def show
     @related_news = @item.related_news if @item = News.find(params[:id])
  end

  def new
  	@news = News.new
  end

  def create
  	@news = News.new(params[:news])
    @news.categories << @category
  	if @news.save
  		flash[:notice] = "Новость добавлена"
  		redirect_to(action: 'list')
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
    @news = News.sorted
  end

  def destroy # Удаление
    @item = News.find(params[:id]).destroy
    flash[:notice] = "Новость \"#{@item.description}\" удалена"
    redirect_to(:action => 'list', section: @section)
  end

  private

  def find_news_section
    @category = params[:category_id]
  end
end
