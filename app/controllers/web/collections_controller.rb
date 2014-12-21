class Web::CollectionsController < ApplicationController
	layout 'web'

  def show
  	@collection = Collection.find(params[:id])
  end
end
