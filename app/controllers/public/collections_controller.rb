class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink!(params[:id])
	end

end
