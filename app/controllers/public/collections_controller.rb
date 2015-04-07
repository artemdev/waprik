class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink!(params[:id])
		if @collection.with_music
			# дата самых новых треков
			@date = @collection.tracks.latest.first.created_at
			# самые новые треки
			@latest_tracks = @collection.tracks.where(created_at: @date.at_beginning_of_day..@date.end_of_day)
			# все треки кроме самых новых
			@tracks = @collection.tracks.without_new(@date).paginate(page: params[:page], per_page: 20)
		elsif @collection.with_films
			# дата самых новых фильмов
			@date = @collection.films.latest.first.created_at
			# самые новые фильмы
			@latest_films = @collection.films.where(created_at: @date.at_beginning_of_day..@date.end_of_day)
			# все фильмы кроме самых новых
			@films = @collection.films.without_new(@date).paginate(page: params[:page], per_page: 20)
		end
	end

	def join_tracks
		@collection = Collection.find(params[:id])
		send_file @collection.full_sound.path, type: @bitrate.file.content_type
	end

end
