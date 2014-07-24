class Admin::FilmQualitiesController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'
	
  def index
  end

  def show
  	@quality = FilmQuality.find(params[:id])
  	@films = []
  	@quality.films.each do |film|
  		if film.files.each do |file|
  			@films << film if file.quality == @quality
  		end
  	end
  	end
  end

end
