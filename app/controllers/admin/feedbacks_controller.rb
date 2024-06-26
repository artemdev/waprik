class Admin::FeedbacksController < ApplicationController
  before_filter :confirm_logged_in!
  before_filter :admin?
  
  layout 'admin'

  def index
    @feedbacks = Feedback.latest
    @feedbacks_without_answer = []
    @feedbacks.each do |feedback|
      @feedbacks_without_answer << feedback unless feedback.reply.present?
    end
  end

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
  		redirect_to feedbacks_path
 		else
  		render :new
  	end
  end

  def list
  	@feedbacks = Feedback.all
  end

  def destroy
    Feedback.find(params[:id]).destroy
    flash[:success] = "Отзыв удален"
    redirect_to admin_feedbacks_path
  end
end
