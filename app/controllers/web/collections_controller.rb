class Web::CollectionsController < ApplicationController
	layout 'web'

  def show
  	@collection = Collection.find(params[:id])
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
