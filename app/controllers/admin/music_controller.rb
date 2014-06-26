class Admin::MusicController < ApplicationController
	layout 'mobile'
	
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
 		# узнать время трека
 		if @track.save 
 			# создать для трека битрейды
 			flash[:success] = "Mp3 успешно добавлена"
 			redirect_to admin_tracks_path
 		else
 			render :new
 		end
	end

end
