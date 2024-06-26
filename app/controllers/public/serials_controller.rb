class Public::SerialsController < ApplicationController
	layout 'mobile'

	def index
		@hits = Serial.hits.latest.paginate(page: params[:page], per_page: 5)
		@genres = FilmGenre.with_serials.paginate(page: params[:page], per_page: 5).uniq
	end

	def category
		@category = Category.find(params[:id])
	end

	def show
		@serial = Serial.find(params[:id])
		@series = @serial.series
	end

  def download
    @file = SerialSerieFile.find(params[:id])
    @file.download += 1
    @file.save
    redirect_to({action: "get_file", id: @file.id})
  end

  def get_file
    file = SerialSerieFile.find(params[:id])
    send_file file.attach.path, content_type: file.attach.content_type, filename: file.serie.serial.title.parameterize + ".#{file.attach.file.extension}"
  end

	def edit
	end

	def destroy
	end
end
