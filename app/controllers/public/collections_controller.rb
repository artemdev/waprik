class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find(params[:id])
	end

	def join_tracks
		@collection = Collection.find(params[:id])
		send_file @collection.join_tracks
	end

end
