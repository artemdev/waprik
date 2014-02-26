class Admin::SerialsController < ApplicationController
	layout 'mobile'

	before_filter :confirm_logged_in
	
	def index
		@serials = Serial.paginate(page: params[:page], per_page: 10).latest
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

	def edit
		@serial = Serial.find(params[:id])
		1.times { @serial.series.build }
	end

	def update
		@serial = Serial.find(params[:id])
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
