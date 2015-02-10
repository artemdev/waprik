class Admin::MusicController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  
  layout 'admin'

	FTP_PATH = "public/ftp/music/"

	def index
		@tracks = Mp3File.paginate(page: params[:page], per_page: 50)
		@collections = Collection.hits
		@today_collections = []
		Collection.today.map { |c| @today_collections << c if c.with_music == true }
	end

	def new
		@track = Mp3File.new
		@files = Dir.glob(File.join(FTP_PATH, "**", "*.mp3")).sort
		@collections = Collection.all
	end

	def show
		@track = find_track params[:id]
	end

	def create
		@track = Mp3File.new(params[:mp3_file])
		@track.new_path = File.open(params[:mp3_file][:new_file])
		@track.set_name_from params[:mp3_file][:new_file]
		@track.set_fname
		@track.artist_name = @track.name.split(' - ').first
		@track.album_name = params[:mp3_file][:album_name].present? ? params[:mp3_file][:album_name] : "песни 2014"
		@track.set_collection(params[:mp3_file][:new_collection]) if params[:mp3_file][:new_collection]
 		if @track.save
 			# id3v2 теги
 			@track.create_id3v2_tags_from @track.name
 			# создаются битрейды
 			LameWorker.perform_async(@track.id)
 			flash[:success] = "Mp3 успешно добавлена"
 			redirect_to admin_tracks_path
 		else
 			render :new
 		end
	end

	def edit
		@track = find_track params[:id]
		@collections = Collection.all
	end

	def update
		@track = Mp3File.find(params[:id])
		@track.update_attributes!(params[:mp3_file])
		@track.set_collection(params[:mp3_file][:new_collection]) if params[:mp3_file][:new_collection]
		if @track.save
			flash[:success] = "Mp3 успешно обновлена"
			redirect_to :back
		else
		 render :new
		end
	end

	def edit_tags
		@track = Mp3File.find(params[:id])
	end

	def update_tags
		track = Mp3File.find(params[:id])

		# сохранение тегов
		# if track.new_path.path && FileTest.exist?(track.new_path.path)
		TagLib::MPEG::File.open(track.new_path.path) do |file|
			tag = file.id3v2_tag

			tag.title = params[:title]
			tag.artist = params[:artist]
			tag.album = params[:album]

			file.save
		end
		flash[:success] = "id3v2 теги успешно сохранены"
		redirect_to admin_tracks_path
	end

	def destroy
		@track = Mp3File.find(params[:id]).destroy
		@track.tire.update_index
		flash[:success] = "Трек удален"
		respond_to do |format|
			format.html { redirect_to admin_tracks_path }
			format.js
		end
	end

	def remove_from_collection
		track = Mp3File.find(params[:id])
		collection = Collection.find(params[:collection_id])
		if collection
			track.collections.delete(collection) 
			flash[:success] = "Трек успешно удален из коллекции"
			redirect_to edit_admin_collection_path(collection)
		else
			flash[:error] = "Произошла ошибка"
			redirect_to edit_collection_path(collection)
		end
	end

	def search
		@tracks = Mp3File.search(params[:keyword])
	end

	def update_multiple
		@tracks = find_track params[:track_ids]
		@tracks.each do |track|
			track.hit = true
			track.save(validate: false)
		end
		flash[:success] = "Треки обновлены"
		redirect_to :back
	end

	def hits
		@track = Mp3File.hits
	end

	private

	def find_track(params)
		Mp3File.find(params)
	end


end
