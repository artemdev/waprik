class Public::FilmGenresController < ApplicationController

	layout 'mobile'

	def show
		@genre = FilmGenre.find(params[:id])
    content = params[:content] 
    if content && content == "serials"
      @serials = @genre.serials.paginate(page: params[:page], per_page: 10)
    else
      @films = @genre.films.latest.visible.paginate(page: params[:page], per_page: 10)
    end
	end

end
