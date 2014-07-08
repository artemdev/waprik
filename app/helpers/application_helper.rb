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
		render(:partial => 'admin/shared/error_messages', :locals => {:object => object})
	end

  def translate_month month
    if month
      "июля"
    end
  end

  def hr_for object, collection
    unless collection.last == object
      "<hr />".html_safe
    end
  end

end
