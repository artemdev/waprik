class Web::CollectionsController < ApplicationController
	layout 'web'

  def index
    if params[:sort_by] == "latest"
      @collections = Collection.latest
    elsif params[:sort_by] == "popular"
      @collections = Collection.popular
    else
      @collections = Collection.all
    end
  end

  def show
  	render text: 'works!'
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
