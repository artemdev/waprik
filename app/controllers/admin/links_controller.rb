class Admin::LinksController < ApplicationController
	layout 'admin'

	before_filter :confirm_logged_in

	def index
		@links = AdsLink.all.paginate(page: params[:page], per_page: 10)
	end

	def edit
		@link = AdsLink.find(params[:id])
	end

	def update
		@link = AdsLink.find(params[:id])
		if @link.update_attributes!(params[:ads_link])
			flash[:success] = "Ссылка успешно обновлена"
			redirect_to admin_links_path
		else
			render :edit
		end		
	end

	def new
		@link = AdsLink.new
	end

	def create
		@link = AdsLink.new(params[:ads_link])
		if @link.save 
			flash[:success] = "Ссылка успешно добавлена"
			redirect_to admin_links_path
		else
			render :new
		end
	end

	def destroy
	end

end
