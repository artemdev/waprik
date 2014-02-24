class Admin::SerialsController < ApplicationController
	layout 'mobile'

	def index
	end

	def new
		@serial = Serial.new
		1.times { @serial.series.build }
	end

	def create
		@serial = Serial.new(params[:serial])
		if @serial.save
			flash[:success] = "Сериал успешно добавлен"
			redirect_to admin_serial_path(@serial.id)
		else
			render(new_admin_serial_path)
		end
	end

	def show
		@serial = Serial.find(params[:id])
	end
end
