class Admin::MusicController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'

	FTP_PATH = "public/ftp/music/"

	before_filter :confirm_logged_in

	def index
		@tracks = Mp3File.latest.paginate(page: params[:page], per_page: 10)
		@collections = Collection.hits
		@new_track = Mp3File.new
	end

	def new
		@track = Mp3File.new
		mp3files = File.join(FTP_PATH, "**", "*.mp3")
		@files = Dir.glob(mp3files).sort
	end

	def show
		@track = Mp3File.find(params[:id])
	end

	def create
		@track = Mp3File.new(params[:mp3_file])
		@track.new_path = File.open(params[:mp3_file][:new_file])
		name = File.basename(params[:mp3_file][:new_file], ".mp3")
		@track.name = name
		@track.fname = Russian.translit(name.gsub(' ', '_').gsub('–', '-').delete('(').delete(':').delete(')').delete('/').delete('?').delete('.').delete('!'))
		@track.artist_name = name.split(' - ').first
		@track.album_name = params[:mp3_file][:album_name].present? ? params[:mp3_file][:album_name] : "песни 2014"
 		if @track.save
 			# id3v2 теги
 			@track.create_id3v2_tags_from name
 			# создаются битрейды
 			LameWorker.perform_async(@track.id)
 			flash[:success] = "Mp3 успешно добавлена"
 			redirect_to admin_tracks_path
 		else
 			render :new
 		end
	end

	def edit
		@track = Mp3File.find(params[:id])
		@collections = Collection.all
	end

	def update
		@track = Mp3File.find(params[:id])
		@track.update_attributes!(params[:mp3_file])
		@track.set_collection(params[:mp3_file][:new_collection])
		if @track.save
			flash[:success] = "Mp3 успешно обновлена"
			redirect_to admin_tracks_path
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
		# elsif track.path.path && FileTest.exist?(track.path.path)
		# 	TagLib::MPEG::File.open(track.path.path) do |file|
		# 		tag = file.id3v2_tag

		# 		tag.title = params[:title]
		# 		tag.artist = params[:artist]
		# 		tag.album = params[:album]

		# 		file.save
		# 	end			
		# end

		flash[:success] = "id3v2 теги успешно сохранены"
		redirect_to admin_tracks_path
	end

	def destroy
		@track = Mp3File.find(params[:id]).destroy
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

end
