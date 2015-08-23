class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink(params[:id])
		@tracks = @collection.tracks.page(params[:page]).per_page(10)
	end

	def join_tracks
		@collection = Collection.find(params[:id])
		send_file @collection.join_tracks
	end

end
