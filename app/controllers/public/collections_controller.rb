class Public::CollectionsController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.all
	end

	def show
		@collection = Collection.find_by_permalink!(params[:id])
		@date = @collection.tracks.latest.first.created_at
		@tracks = []
		@last_tracks = []
		@collection.tracks.each do |track| 
			@last_tracks << track if track.created_at > @date.at_beginning_of_day && track.created_at < @date.end_of_day
		end
		@collection.tracks.each do |track|
			@tracks << track if track.created_at < @date.at_beginning_of_day
		end
		@tracks = @tracks.reverse.paginate(page: params[:page], per_page: 20)
	end

end
