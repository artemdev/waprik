class Public::SerialsController < ApplicationController
	layout 'public'

	def index
		@hits = Serial.hits.latest
		@categories = Category.with_serials
	end

	def category
		@category = Category.find(params[:id])
	end

	def show
	end

	def edit
	end

	def destroy
	end
end
