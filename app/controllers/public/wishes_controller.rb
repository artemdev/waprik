class Public::WishesController < ApplicationController

	def new
		@film = Film.find(params[:film_id])
		if @film.wishes.create!
			flash[:success] = 'Пожелание успешно отправлено администрации'
			redirect_to @film
		else
			redirect_to :back
		end
	end

end
