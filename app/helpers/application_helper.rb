# encoding: utf-8
module ApplicationHelper

  def translate_type( name ) 
    case name
      when "music"
        name = "музыка"
      when "video"
        name = "видео"
      when nil
        name = "не удалось определить тип новости"
    end
    return name
  end

	def error_messages_for(object)
		render(:partial => 'shared/error_messages', :locals => {:object => object})
	end

end
