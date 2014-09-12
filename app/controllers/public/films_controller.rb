class Public::FilmsController < ApplicationController
	layout 'mobile'
	
  # мониторинг обновлени качеств фильмов
  def updating
  	@files = FilmFile.order("created_at DESC")
  	# TODO refactoring
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
		@latest_date = Film.latest.first.created_at.strftime("%d.%m.%y") if Film.latest.first
		# @favourite_date = Film.latest.favourite.first.created_at
	end

	def show
		@film = Film.find_by_permalink(params[:id])
		@film ||= Film.find(params[:id])
	end

	def news
		@films = Film.latest.favourite.limit(100).paginate(page: params[:page], per_page: 10)
	end

	def latest
		@films = Film.latest.paginate(page: params[:page], per_page: 10)
	end


end
