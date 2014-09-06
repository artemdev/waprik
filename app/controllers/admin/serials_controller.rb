class Admin::SerialsController < ApplicationController
  before_filter :confirm_logged_in

  layout 'admin'
	
	def index
		@serials = Serial.paginate(page: params[:page], per_page: 10).latest
	end

	def new
		n = 1
		@serial = Serial.new
		n.times { @serial.series.build }
		n.times { @serial.seasons.build }
		@categories = Category.for_serials
	end

	def create
		@serial = Serial.new(params[:serial])
		@serial.add_genres params[:serial][:new_genres]
		if @serial.save
			flash[:success] = "Сериал успешно добавлен"
			redirect_to edit_admin_serial_path(@serial)
		else
			render :new
		end
	end

	def show
		@serial = Serial.find(params[:id])
		@categories = Category.for_serials
	end

	def edit
		n = 1
		@serial = Serial.find(params[:id])
		@categories = Category.for_serials
		@qualities = FilmQuality.all
		n.times { @serial.series.build }
		n.times { @serial.seasons.build }
	end

	def update
		@serial = Serial.find(params[:id])
		@serial.add_genres params[:serial][:new_genres]
		if @serial.update_attributes(params[:serial])
			flash[:success] = "Сериал успешно обновлен"
			redirect_to edit_admin_serial_path(@serial.id)
		else
			render 'edit'
		end

	end

	def destroy
		Serial.find(params[:id]).destroy
		flash[:notice] = "Сериал успешно удален"
		redirect_to action: 'index'
	end
end
