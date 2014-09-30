class Admin::VkPostsController < ApplicationController
	before_filter :setup

	layout 'admin'

	def new
	end

	def create
		# TODO add to remote jobs
		collection_name = params[:collection_name].strip
		collection = Collection.find_or_create_by_name(collection_name)
		MusicPostsWorker.perform_async(params[:post_url], collection.id)
		redirect_to admin_collection_path(collection.permalink)
	end

	private

	def setup
		@collections = []
		@all_collections = Collection.all
		@all_collections.each {|c| @collections << c if c.with_music }
	end

end
