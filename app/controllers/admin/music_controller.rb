class Admin::MusicController < ApplicationController
	layout 'mobile'
	
	before_filter :confirm_logged_in


	def index
		@collections = Collection.top
		@categories = Category.sorted
	end
end
