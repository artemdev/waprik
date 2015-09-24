class Public::MusicController < ApplicationController
	layout 'mobile'

	def index
		@tracks = Mp3File.all
		@collections = Collection.with_music.fresh.limit(10)
	end

	def news
		@date = Mp3File.first.created_at
		@tracks = Mp3File.without_new(@date).paginate(page: params[:page], per_page: 20)
		@last_tracks = Mp3File.published_at(@date)
	end

	def show
		@track = Mp3File.find_by_permalink(params[:id])
		@recomendations = []
		@track.collections.each do |c|
			c.tracks.map {|t| @recomendations << t unless t == @track }
		end
		@recomendations = @recomendations.paginate(page: params[:page], per_page: 10)
		if !@track.present?
			flash[:error] = "трек не найден"
			redirect_to tracks_path 
		end
	end

	def download
		@track = Mp3File.find_by_permalink(params[:id])
		@track.download! request.env["HTTP_USER_AGENT"]
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
		elsif params[:bitrate] == "orig"
			send_file "#{@track.new_path.path}", type: 'audio/mpeg', filename: @track.fname + '.mp3'
		elsif @bitrate.file
			send_file @bitrate.file.path, type: @bitrate.file.content_type, filename: (@track.fname + '.mp3')
		end
	end

	def top_mp3
		@tracks = Mp3File.top(200).where("created_at >= ?", 3.month.ago)
		@rus_hits = []
		@eng_hits = []
		@tracks.each do |track|
			@eng_hits << track if track.artist && track.artist.eng?
			@rus_hits << track if track.artist && track.artist.rus?
		end	
	end
end
