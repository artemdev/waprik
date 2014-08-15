class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink!(params[:id])
		if @collection.with_music
			@date = @collection.tracks.latest.first.created_at
			@tracks = []
			@last_tracks = []
			@collection.tracks.each do |track| 
				@last_tracks << track if track.created_at > @date.at_beginning_of_day && track.created_at < @date.end_of_day
			end
			@collection.tracks.each do |track|
				@tracks << track if track.created_at < @date.at_beginning_of_day
			end
			@tracks = @tracks.paginate(page: params[:page], per_page: 20)
			@date = @last_tracks.last.created_at
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
