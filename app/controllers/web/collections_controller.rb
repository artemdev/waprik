class Web::CollectionsController < ApplicationController
	layout 'web'

  def index
    if params[:sort_by] == "latest"
      @collections = FilmCollection.latest.paginate(params[:page]).per_page(10)
    elsif params[:sort_by] == "popular"
      @collections = FilmCollection.popular.paginate(page: params[:page], per_page: (10))
    else
      @collections = FilmCollection.all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
  	render text: 'show collection'
  end

  def films
  	@collection = find_collection
  	@films = @collection.films
  end

private

	def find_collection
		Collection.find(params[:id])
	end

end
