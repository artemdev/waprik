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

  # Сериалы
  def status_for serial
    if serial.updating?
     "серии обновляются"
    else
     "сезон закончен"
    end
  end

  def count_downloads_for serial
    serial.series.each do |series|
      series.attachments.each do |attach|
        @downloads = attach.count_mp4_320 + attach.count_mp4_640 + attach.count_low_3gp
      end
    end
    return @downloads.to_i
  end
end
