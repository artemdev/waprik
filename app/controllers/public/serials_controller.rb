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

  # TODO сделать скачивание
  def download
    @series = Series.find(params[:id])
    version = params[:version]
    case version
      when 'low_3gp'
        @series.dl_low_3gp += 1
        @series.save
        link = @series.low_3gp.url
      when 'mp4_320'
        @series.dl_mp4_320 += 1
        @series.save
        link = @series.mp4_320.url
      when 'mp4_640'
        @series.dl_mp4_640 += 1
        @series.save
        link = @series.mp4_640.url
    end
    redirect_to(link)
  end

	def edit
	end

	def destroy
	end
end
