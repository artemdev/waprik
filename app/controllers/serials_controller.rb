class SerialsController < ApplicationController

	def index
		@hits = Serial.hits
	end

	def show
	end

	def edit
	end

	def destroy
	end

end
