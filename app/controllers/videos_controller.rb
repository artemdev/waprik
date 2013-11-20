# encoding: utf-8
class VideosController < ApplicationController

	layout 'mobile'

	before_filter :confirm_logged_in
	before_filter :find_category, :only => ['new', 'create', 'new', 'delete']

	def index
		@categories = Category.sorted
		@collections = Collection.top
	end

### РАБОТА С ВИДЕО ###


	def new # Добавление нового видео (шаг 1)
		@video = Video.new(:category_id => @category.id)
		@categories = Category.all.collect {|i| [i.name, i.id]}
	end

	def create # Добавление нового видео (шаг 2)
		@video = Video.new(params[:video])
		@category.videos << @video
		@video.add_collection
		# unless @collections.empty?
		# 	@video.collections << @collection
		# end
		if @video.save
			flash[:notice] = "Видео добавлено"
			redirect_to(:action => 'category', :id => @category.id)
		else
			render('new')
		end
	end

	def show # Показ видео
		@video = Video.find(params[:id])
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

	
	def edit # Редактирование видео (шаг 1)
		@video = Video.find(params[:id])
		@categories = Category.all.collect {|i| [i.name, i.id]}
	end

	def update # Редактирование видео (шаг 2)
		@categories = Category.all.collect {|i| [i.name, i.id]}
		@video = Video.find(params[:id])
		if @video.update_attributes(params[:video])
			@video.add_collection(@video)
			flash[:notice] = "Видео обновлено"
			redirect_to(:action => 'edit', :id => @video.id)
		else
			render('edit')
		end
	end

	def delete # Удаление видео (полностью)
		video = Video.find(params[:id])
		video.remove_screen
		video.remove_low_3gp
		video.remove_mp4_176	
		video.remove_mp4_320		
		video.destroy
		flash[:notice] = "Видео удалено"
		redirect_to(:action => 'category', :id => @category.id)
	end

	def delete_screen # Удаление скриншота видео
		@video = Video.find(params[:id])
		@video.remove_screen!
		redirect_to(:action => 'edit', :id => @video.id)
	end

	def delete_from_admin_panel # Удаление выбранного формата видео
		@video = Video.find(params[:id])
		version = params[:version]
		case version
			when '3gp'
				@video.remove_low_3gp!
				@video.save
			when 'mp4_176'
				@video.remove_mp4_176!
				@video.save
			when 'mp4_320'
				@video.remove_mp4_320!
				@video.save
		end
		redirect_to(:action => 'edit', :id => @video.id, :category_id => @category.id)
	end

### РАБОТА С КАТЕГОРИЯМИ ВИДЕО ###

	def category # Листинг видео из категории
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

	def new_category # Добавление новой категории (шаг 1)
		@category = Category.new
	end

	def create_category # Добавление новой категории (шаг 2)
		@category = Category.new(params[:category])
		if @category.save
			flash[:notice] = "Категория успешно создана"
			redirect_to(:action => 'index')
		else
			render('new_category')
		end
	end

	def edit_category # редактирование категории (шаг 1)
		@category = Category.find(params[:id])
	end

	def update_category # редактирование категории (шаг 2)
		@category = Category.find(params[:id])
		@category.update_attributes(params[:category])
		if @category.save
			flash[:notice] = "Категория успешно создана"
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def destroy_category # удаление категории
		Category.find(params[:id]).destroy
		flash[:notice] = "Жанр удален"
		redirect_to(:action => 'index')
	end

### РАБОТА С КОЛЛЕКЦИЯМИ ВИДЕО ###

	def collection # листинг видео из выбранной коллекции
		@collection = Collection.find(params[:id])
	end

	def collections # листинг всех коллекций
		@collections = Collection.all
	end

	def new_collection # создаем новую коллекцию (шаг 1)
		@collection = Collection.new
	end

	def create_collection # создаем новую коллекцию (шаг 2)
		@collection = Collection.new(params[:collection])
		if @collection.save
			flash[:notice] = "Подборка успешно добавлена"
			redirect_to(:action => 'collections')
		else
			render('new_collection')
		end
	end

	def remove_collection # Удаление коллеции
		Collection.find(params[:colleciton_id]).destroy
		flash[:notice] = "Подборка успешно удалена"
		redirect_to(:action => 'collections')
	end

	def remove_video_from_collection # удаление видео из коллекции
		@video = Video.find(params[:id])
		@video.collections.delete(Collection.find_by_id(params[:collection_id]))
		unless @video.nil?
			redirect_to(:action => 'edit', :id => @video.id)
		else
			redirect_to(:action => 'collections')
		end
	end


	private

	def find_category # Определение категории по передаваемому значению category_id
		@category = Category.find(params[:category_id])
	end

end

