class Admin::RepliesController < ApplicationController
	before_filter :confirm_logged_in

  def new
  	@feedback = Feedback.find(params[:feedback_id])
  	@reply = AdminReply.new
  end

  def create
  	@feedback = Feedback.find(params[:feedback_id])
  	@reply = current_user.replies.new(params[:admin_reply])
  	@reply.replyadble = @feedback
  	if @reply.save
  		flash[:success] = "Ответ отправлен"
  		redirect_to admin_feedbacks_path
  	else
  		render :new
  	end
  end

end
