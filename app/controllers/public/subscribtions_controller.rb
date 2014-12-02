class Public::SubscribtionsController < ApplicationController
	before_filter :confirm_logged_in!

	def index
		@subscribtions = current_user.subscribtions
	end

	def create
		# find content (params[:content], params[:id])
		content = params[:content].capitalize.constantize.find(params[:id])
		if current_user.subscribed_to? content
			redirect_to :back, notice: 'вы уже подписаны'
		elsif current_user.subscribe_to content
			redirect_to :back, notice: 'подписка оформлена'
		else
			redirect_to :back, alert: 'не удалось подписаться'
		end
	end

	def destroy
		content = params[:content].capitalize.constantize.find(params[:id])
		if current_user.destroy_subscribtion_for content
			redirect_to :back, notice: 'вы успешно отписались'
		else
			redirect_to :back, alert: 'вы успешно подписались'
		end
	end



end
