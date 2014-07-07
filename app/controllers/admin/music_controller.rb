class Admin::MusicController < ApplicationController
	layout 'admin'
	
	before_filter :confirm_logged_in

	def index
		@tracks = Mp3File.latest.paginate(page: params[:page], per_page: 10)
		@collections = Collection.top
	end

	def new
		@track = Mp3File.new
	end

	def create
		@track = Mp3File.new(params[:mp3_file])
		@track.fname = params[:mp3_file][:name].gsub(' ', '_').delete('(').delete(')').delete('/')
 		if @track.save 
 			# создать для трека битрейды
 			LameWorker.perform_async(@track.id)
 			flash[:success] = "Mp3 успешно добавлена"
 			redirect_to admin_tracks_path
 		else
 			render :new
 		end
	end

	def edit
		@track = Mp3File.find(params[:id])
	end

	def update
	end

	def edit_tags
		@track = Mp3File.find(params[:id])
	end

	def update_tags
		track = Mp3File.find(params[:id])

		# сохраняются теги
		TagLib::MPEG::File.open(track.new_path.path) do |file|
			tag = file.id3v2_tag

			tag.title = params[:title]
			tag.artist = params[:artist]
			tag.album = params[:album]

			if file.save
				flash[:success] = "id3v2 теги успешно сохранены"
				redirect_to admin_tracks_path
			end
		end
	end

	def destroy
		@track = Mp3File.find(params[:id]).destroy
		flash[:success] = "Трек удален"
		respond_to do |format|
			format.html { redirect_to admin_tracks_path }
			format.js
		end
	end
end
