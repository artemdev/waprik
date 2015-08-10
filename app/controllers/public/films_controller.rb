class Public::FilmsController < ApplicationController
	layout 'mobile'
	
  # мониторинг обновлени качеств фильмов
  def updating
  	@files = FilmFile.order("created_at DESC")
  	# RF
  	@films = [].uniq.paginate(page: params[:page], per_page: 10)
  	@files.each do |file|
  		@films << file.film
  	end
  end

	def index
		if params[:film_name]
			@films = Film.search(params[:film_name])
			@genres = FilmGenre.all
		else
			@genres = FilmGenre.all
			@films = []
		end
		@collections = Collection.latest.limit(20)
		@latest_date = Film.latest.visible.first.created_at.strftime("%d.%m.%y") if Film.latest.visible.first
		@collections_genres = CollectionGenre.all
		# @favourite_date = Film.latest.favourite.first.created_at
	end

	def show
		@film = Film.find_by_permalink(params[:id])
		@film ||= Film.find(params[:id])
		# создать визит
		@film.track_visit_from @source if params[:from_film].present?
		# TODO 6.10
		# @common_films = @film.common_films

	end

	def news
		@films = Film.latest.visible.favourite.limit(100).paginate(page: params[:page], per_page: 10)
	end

	def latest
		@films = Film.latest.visible.paginate(page: params[:page], per_page: 5)
	end


end
