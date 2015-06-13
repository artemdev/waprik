class Admin::VkPostsController < ApplicationController
	before_filter :setup
  before_filter :confirm_logged_in!
  before_filter :admin?
  
	layout 'admin'

	def new
	end

	# def get_ero
	# 	posts = PublicPage.parse_ero
	# 	flash[:success] = "Добавлено #{posts} новых постов"
	# 	redirect_to admin_pictures_path
	# end

	def create
		# TODO add to remote jobs
		collection_name = params[:collection_name].strip
		collection = Collection.find_or_create_by_name(collection_name)
		collection.update_attributes(hit: true) if params[:hit] == "on"
		# взять треки из vk
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
