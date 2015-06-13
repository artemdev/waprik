class Public::LinksController < ApplicationController

	def show
		link = AdsLink.find(params[:id])
		link.count_conversion!
		redirect_to "http://" + link.to
	end

end
