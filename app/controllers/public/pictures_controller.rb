class Public::PicturesController < ApplicationController
	layout 'mobile'

	def index
		@pictures = Picture.erotic.latest.paginate(page: params[:page], per_page: 7)
	end

  def download 
    @picture = Picture.find_by_id(params[:id])
    @picture.downloads.create!(user_agent: request.env["HTTP_USER_AGENT"])
    @picture.save
    link = @picture.image.url
    redirect_to(link)
  end

end
