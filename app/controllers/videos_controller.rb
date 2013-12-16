# encoding: utf-8
class VideosController < ApplicationController
	layout 'mobile'
	
	before_filter :confirm_logged_in
	before_filter :find_category, :only => ['new', 'create', 'delete']

	def index
		@categories = Category.sorted
		@collections = Collection.top
	end

	### РАБОТА С ВИДЕО ###

 	# Добавление нового видео 
	def new # шаг 1
		@video = Video.new(:category_id => @category.id)
		@categories = Category.all.collect {|i| [i.name, i.id]}
	end

	def create # шаг 2
		@video = Video.new(params[:video])
		@categories = Category.all.collect {|i| [i.name, i.id]}
		@category.videos << @video
		@video.add_to_collection
		if @video.save
			flash[:notice] = "Видео добавлено"
			redirect_to(:action => 'category', :id => @category.id)
		else
			render('new', :category_id => @category.id)
		end
	end

	# Показ видео
	def show 
		@video = Video.find(params[:id])
	end

	# Скачивание видео
	def download 
		@video = Video.find(params[:id])
		version = params[:version]
		case version
			when 'low_3gp'
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
			when 'mp4_640'
				@video.downloads += 1
				@video.save
				link = @video.mp4_640.url
		end
		redirect_to(link)
	end

	# Редактирование видео (шаг 1)
	def edit 
		@video = Video.find(params[:id])
		@categories = Category.all.collect {|i| [i.name, i.id]}
	end

	# Редактирование видео (шаг 2)
	def update 
		@categories = Category.all.collect {|i| [i.name, i.id]}
		@video = Video.find(params[:id])
		if @video.update_attributes(params[:video])
			@video.add_to_collection
			flash[:notice] = "Видео обновлено"
			redirect_to(:action => 'edit', :id => @video.id)
		else
			render('edit')
		end
	end

	# Удаление видео (полностью)
	def delete 
		video = Video.find(params[:id])
		video.remove_screen
		video.remove_low_3gp
		video.remove_mp4_176	
		video.remove_mp4_320
		video.remove_mp4_640
		video.destroy
		flash[:notice] = "Видео удалено"
		redirect_to(:action => 'category', :id => @category.id)
	end

	# Удаление скриншота видео
	def delete_screen 
		@video = Video.find(params[:id])
		@video.remove_screen!
		redirect_to(:action => 'edit', :id => @video.id)
	end

	# Удаление выбранного формата видео
	def delete_from_admin_panel 
		@video = Video.find(params[:id])
		version = params[:version]
		case version
			when 'low_3gp'
				@video.remove_low_3gp!
				@video.save
			when 'mp4_176'
				@video.remove_mp4_176!
				@video.save
			when 'mp4_320'
				@video.remove_mp4_320!
				@video.save
			when 'mp4_640'
				@video.remove_mp4_640!
				@video.save
		end
		redirect_to(:action => 'edit', :id => @video.id)
	end

### РАБОТА С КАТЕГОРИЯМИ ВИДЕО ###

	# Листинг видео из категории
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

	# Добавление новой категории (шаг 1)
	def new_category 
		@category = Category.new
	end

	# Добавление новой категории (шаг 2)
	def create_category 
		@category = Category.new(params[:category])
		if @category.save
			flash[:notice] = "Категория успешно создана"
			redirect_to(:action => 'index')
		else
			render('new_category')
		end
	end

	# редактирование категории (шаг 1)
	def edit_category 
		@category = Category.find(params[:id])
	end

	# редактирование категории (шаг 2)
	def update_category 
		@category = Category.find(params[:id])
		@category.update_attributes(params[:category])
		if @category.save
			flash[:notice] = "Категория успешно создана"
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	# удаление категории
	def destroy_category 
		@category = Category.find(params[:id])
		if @category.destroy_videos
			@category.destroy
		end
		flash[:notice] = "Жанр удален"
		redirect_to(:action => 'index')
	end

### РАБОТА С КОЛЛЕКЦИЯМИ ВИДЕО ###

	# листинг видео из выбранной коллекции
	def collection 
		@collection = Collection.find(params[:id])
	end

	# листинг всех коллекций
	def collections
		@collections = Collection.where(with_videos: true)
	end

	# создаем новую коллекцию 
	def new_collection 
		@collection = Collection.new
	end

	def create_collection # шаг 2
		@collection = Collection.new(params[:collection])
		if @collection.save
			flash[:notice] = "Подборка успешно добавлена"
			redirect_to(:action => 'collections')
		else
			render('new_collection')
		end
	end

	# обновление коллекции
	def edit_collection # шаг 1
		@collection = Collection.find(params[:id])
	end

	def update_collection # шаг 1
		@collection = Collection.find(params[:id])
		if @collection.update_attributes(params[:collection])
			flash[:notice] = "Подборка успешно обновлена"
			redirect_to(:action => 'collections')
		else
			render('edit_collection')
		end
	end

	# Удаление коллеции
	def remove_collection 
		Collection.find(params[:id]).destroy
		flash[:notice] = "Подборка успешно удалена"
		redirect_to(:action => 'collections')
	end

	# удаление видео из коллекции
	def remove_video_from_collection 
		@video = Video.find(params[:id])
		@video.collections.delete(Collection.find_by_id(params[:collection_id]))
		unless @video.nil?
			redirect_to(:action => 'edit', :id => @video.id)
		else
			redirect_to(:action => 'collections')
		end
	end


	private
	
	# Определение категории по передаваемому значению category_id
	def find_category 
		@category = Category.find(params[:category_id])
	end

end

