class Public::FeedbacksController < ApplicationController
	layout 'mobile'

	def show
  	@feedback = Feedback.find(params[:id])
  end

  def new
  	@feedback = Feedback.new(type: params[:type])
  end

  def create
  	@feedback = Feedback.new(params[:feedback])
  	if @feedback.save
  		flash[:success] = "Спасибо! Отзыв отправлен и появится в разделе как только на него ответит администратор"
  		redirect_to(action: 'list')
 		else
  		render('new')
  	end
  end

  def list
  	@feedbacks = Feedback.published
  end
end
