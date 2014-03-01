class Public::SerialsController < ApplicationController
	layout 'mobile'

	def index
		@hits = Serial.hits.latest.paginate(page: params[:page], per_page: 5)
		@categories = Category.for_serials.paginate(page: params[:page], per_page: 5)
	end

	def category
		@category = Category.find(params[:id])
	end

	def show
		@serial = Serial.find(params[:id])
		@series = @serial.series.latest
	end

	def edit
	end

	def destroy
	end
end
