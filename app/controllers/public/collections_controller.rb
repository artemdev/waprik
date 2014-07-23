class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink!(params[:id])
		@date = @collection.tracks.last.created_at
		@tracks = Mp3File.without_new(@date).latest.paginate(page: params[:page], per_page: 20)
		@last_tracks = Mp3File.published_at(@date)
	end

end
