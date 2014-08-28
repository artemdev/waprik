class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	# refactoring ...
	#
	def show
		@collection = Collection.find_by_permalink!(params[:id])
		if @collection.with_music
			# дата самых новых треков
			@date = @collection.tracks.latest.first.created_at
			# самые новые треки
			# @last_tracks = []
			@latest_tracks = @collection.tracks.where(created_at: @date.at_beginning_of_day..@date.end_of_day)
			# @last_tracks = @collection.tracks.each do |track| 
			# 	@last_tracks << track if track.created_at > @date.at_beginning_of_day && track.created_at < @date.end_of_day
			# end
			# все треки кроме самых новых
			# @tracks = []
			# @collection.tracks.each do |track|
			# 	@tracks << track if track.created_at < @date.at_beginning_of_day
			# end
			# @tracks = @collection.tracks.where("created_at < ?", @date.at_beginning_of_day)
			@tracks = @collection.tracks.without_new(@date).paginate(page: params[:page], per_page: 20)
		elsif @collection.with_films
			@date = @collection.films.latest.first.created_at
			@films = []
			@last_films = []
			@collection.films.each do |film| 
				@last_films << film if film.created_at > @date.at_beginning_of_day && film.created_at < @date.end_of_day
			end
			@collection.films.each do |film|
				@films << film if film.created_at < @date.at_beginning_of_day
			end
			@films = @films.reverse.paginate(page: params[:page], per_page: 20)
			@date = @last_films.last.created_at
		end
	end

end
