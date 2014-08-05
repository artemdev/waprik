class Public::MusicController < ApplicationController
	layout 'mobile'

	def index
		@tracks = Mp3File.all
		@collections = []
		Collection.fresh.hits.each do |collection|
			@collections << collection if collection.with_music
		end
	end

	def news
		@date = Mp3File.latest.first.created_at
		@tracks = Mp3File.without_new(@date).latest.paginate(page: params[:page], per_page: 20)
		@last_tracks = Mp3File.published_at(@date).latest
	end

	def show
		@track = Mp3File.find_by_permalink(params[:id])
	end

	# скачивание состоит из 2-х действий, чтобы избежать неправильного подсчета скачиваний
	def download
		@track = Mp3File.find(params[:id])
		@track.downloads += 1
		@track.save
		@bitrate = @track.bitrates.find_by_file_bitrate(params[:bitrate])
		if @track.path.path
			case params[:bitrate]
				when "128"
					send_file "#{@track.path.path}_128.mp3", type: 'audio/mpeg', filename: @track.fname + '.mp3'
				when "64"
					send_file "#{@track.path.path}_64.mp3", type: 'audio/mpeg', filename: @track.fname + '.mp3'
				when "32"
					send_file "#{@track.path.path}_32.mp3", type: 'audio/mpeg', filename: @track.fname + '.mp3'
			end
		elsif @bitrate.file
			send_file @bitrate.file.path, type: @bitrate.file.content_type, filename: (@track.fname + '.mp3')
		end
	end

	def top_mp3
		@tracks = Mp3File.latest.hits.limit(200).where("created_at >= ?", 3.month.ago)
		@rus_hits = Array.new
		@eng_hits = Array.new
		@tracks.each do |track|
			@eng_hits << track if track.artist && track.artist.eng?
			@rus_hits << track if track.artist && track.artist.rus?
		end	
	end
end
