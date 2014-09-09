class Admin::VideosController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'
	
	before_filter :confirm_logged_in
	before_filter :find_category, :only => ['new', 'create', 'delete']

	FTP_PATH = "public/ftp/videos/"

	def index
		@categories = Category.sorted
		@collections = Collection.top
	end

	def new
		@video = Video.new(:category_id => @category.id)
		@categories = Category.all.collect {|i| [i.name, i.id]}
  	@files = Dir.glob(FTP_PATH + "*").sort
	end

	def create
		@video = Video.new(params[:video])
		@categories = Category.all.collect {|i| [i.name, i.id]}
		@category.videos << @video
		@video.add_to_collection
		VideoWorker.perform_async()
		if @video.save
		flash[:notice] = "Видео добавлено"
			redirect_to(:action => 'category', :id => @category.id)
		else
			render('new', :category_id => @category.id)
		end
	end

	def show 
		@video = Video.find(params[:id])
	end

	def download 
		@video = Video.find(params[:id])
		version = params[:version]
		case version
			when 'low_3gp'
				@video.downloads += 1
				@video.save
				link = @@video.low_3gp.url
			when 'mp4_320'
				@video.downloads += 1
				@video.save
				link = @video.mp4_320.url
			when 'mp4_640'
				@video.downloads += 1
				@video.save
				link = @video.mp4_640.url
		end
		send_file(link)
	end

	def edit 
		@video = Video.find(params[:id])
		@categories = Category.all.collect {|i| [i.name, i.id]}
  	@files = Dir.glob(FTP_PATH + "*")
	end

	def update 
		@categories = Category.all.collect {|i| [i.name, i.id]}
		@video = Video.find(params[:id])

 		@video.low_3gp = File.open(params[:video][:ftp_low_3gp]) unless params[:video][:ftp_low_3gp].nil? || params[:video][:ftp_low_3gp].empty?
  	@video.mp4_320 = File.open(params[:video][:ftp_mp4_320]) unless params[:video][:ftp_mp4_320].nil? || params[:video][:ftp_mp4_320].empty?
 		@video.mp4_640 = File.open(params[:video][:ftp_mp4_640]) unless params[:video][:ftp_mp4_640].nil? || params[:video][:ftp_mp4_640].empty?
		
		if @video.update_attributes(params[:video])
			File.delete(params[:video][:ftp_low_3gp]) unless params[:video][:ftp_low_3gp].nil? || params[:video][:ftp_low_3gp].empty?
			File.delete(params[:video][:ftp_mp4_320]) unless params[:video][:ftp_mp4_320].nil? || params[:video][:ftp_mp4_320].empty?
			File.delete(params[:video][:ftp_mp4_640]) unless params[:video][:ftp_mp4_640].nil? || params[:video][:ftp_mp4_640].empty?
			
			@video.add_to_collection
			flash[:notice] = "Видео обновлено"
			redirect_to(action: 'edit', id: @video.id)
		else
			render('edit')
		end
	end

	def delete 
		video = Video.find(params[:id])
		video.remove_screen
		video.remove_low_3gp
		video.remove_mp4_320
		video.remove_mp4_640
		video.destroy
		flash[:notice] = "Видео удалено"
		redirect_to(:action => 'category', :id => @category.id)
	end

	def delete_screen 
		@video = Video.find(params[:id])
		@video.remove_screen!
		redirect_to(:action => 'edit', :id => @video.id)
	end

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

	### КОЛЛЕКЦИИ ###

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
