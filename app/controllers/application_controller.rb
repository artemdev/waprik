# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery


SECTIONS = ['music', 'video']

  def translate_type( name ) 
    case name
      when "music"
        name = "Музыка"
      when "video"
        name = "Видео"
      when nil
        name = "Не удалось определить тип новости"
    end
    return name
  end

  
  protected

  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Please, log in"
  		redirect_to(:controller => 'access', :action => 'login')
  		return 'false'
  	else
  		return true
  	end
  end

end
