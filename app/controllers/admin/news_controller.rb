class Admin::NewsController < ApplicationController
	layout 'mobile'
  
  before_filter :confirm_logged_in

  def index
    @news = News.all
  end

  def show
     @related_news = @item.related_news if @item = News.find(params[:id])
  end

  def new
  	@news = News.new
    @categories = Category.for_news
  end

  def create
  	@news = News.new(params[:news])
  	if @news.save
  		flash[:notice] = "Новость добавлена"
  		redirect_to(action: 'index')
  	else
  		render('new')
  	end
  end

  def edit
    @item = News.find(params[:id])
    @sections = ['@news.section']
  end

  def update
    @item = News.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Новость обновлена"
      redirect_to(:action => 'show', :id => @item.id, :section => @item.section)
    else
      render('edit')
    end
  end

  def destroy
    @item = News.find(params[:id]).destroy
    flash[:notice] = "Новость \"#{@item.description}\" удалена"
    redirect_to(:action => 'list', section: @section)
  end

end
