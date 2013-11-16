# encoding: utf-8
module NewsHelper

  def translate_type( name )
    case name
      when "music"
        name = "Музыка"
      when "video"
        name = "Видео"
      when nil
        name = "не удалось определить"
    end
    return name
  end

end
