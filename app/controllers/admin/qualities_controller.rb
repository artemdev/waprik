class Admin::QualitiesController < ApplicationController
	before_filter :confirm_logged_in

  def show
  	quality_title = params[:quality]
   	quality_title ||= "CAMRip"
		@quality = FilmQuality.find_by_title(params[:quality])
 		@films = @quality.films
  end
end
