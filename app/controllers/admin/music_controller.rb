class Admin::MusicController < ApplicationController
	layout 'mobile'

	def index
		@collections = Collection.top
		@categories = Category.sorted
	end
end
