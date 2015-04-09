class Admin::FilmGenresController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  
  layout 'admin'
  
  def index
  	@genres = FilmGenre.all
  end

  def edit
		@genre = FilmGenre.find(params[:id])
  end

  def update
  	@genre = FilmGenre.find(params[:id])
		if @genre.update_attributes(params[:genre])
			flash[:success] = "Жанр успешно обновлен"
			redirect_to admin_film_genres_path
		else
			render 'edit'
		end
  end

  def show
 		@genre = FilmGenre.find(params[:id])
    content = params[:content] 
    if content && content == "serials"
      @serials = @genre.serials.latest.paginate(page: params[:page], per_page: 10)
    else
      @films = @genre.films.visible.latest.paginate(page: params[:page], per_page: 10)
    end
  end

  def destroy
  	FilmGenre.find(params[:id]).destroy
  	redirect_to :back
  end
end
