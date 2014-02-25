module ApplicationHelper

  def news_sections item
    type = []

    item.categories.each do |category|
      case type
        when category.with_music?
          type << "музыка"
        when category.with_videos?
          type << "видео"
        when category.with_videos?
          type << "сериалы"
        when category.with_videos?
          type << "видео"
      end
    end

    if !type.join(', ').empty?
     return type.join(', ')
    else
      return "Тип новости не определен"
    end
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
