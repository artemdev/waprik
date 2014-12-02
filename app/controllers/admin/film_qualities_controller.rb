class Admin::FilmQualitiesController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  
  layout 'admin'
	
  def index
  end

  def show
  	@quality = FilmQuality.find(params[:id])
  	@films = Array.new
  	Film.all.each do |film|
  		film.files.each do |file|
  			@films << film if file.quality == @quality && !@films.include?(file.film)
  		end
		end
  end

end
