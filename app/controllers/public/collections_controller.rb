class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink(params[:id])
		@films = @collection.films
		@tracks = @collection.tracks
	end

	def join_tracks
		@collection = Collection.find(params[:id])
		send_file @collection.join_tracks
	end

end
