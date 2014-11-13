class VkPusher
  SERIALS_PUBLIC_ID = "27786322"
  FILMS_PUBLIC_ID = "44657162"

  # сериал в vk
  # def serial serial_id, user, filepath
  #   serial = Serial.find(serial_id)
		# vk = VkontakteApi::Client.new(user.vk_access_token)
		# # получение vk url для загрузки
		# vk_responce = vk.video.save(group_id: SERIALS_PUBLIC_ID)
		# vk_video = VkontakteApi.upload(url: vk_responce.upload_url, video: filepath)
		# vk_video.gid = SERIALS_PUBLIC_ID
		# vk.video.add(vk_video)
  # end

  # фильм в vk
  def film film, user, filepath=nil
    vk = VkontakteApi::Client.new(user.vk_access_token)
    # загрузить cover в vk
    # отправить в vk
    vk.wall.post(owner_id: ("-" + FILMS_PUBLIC_ID), message: film.title, from_group: 1, attachments: Rails.application.routes.url_helpers.film_url(film, host: 'waprik.org'))
    film.vk = true
    save
  end

  # сериал в vk
  def serial content, user
    vk = VkontakteApi::Client.new(user.vk_access_token)
    # vk url для загрузки
    vk_responce = vk.photos.getWallUploadServer(group_id: SERIALS_PUBLIC_ID)
    # загрузка и сохранение
    # vk_photo = VkontakteApi.upload(url: vk_responce.upload_url, photo: [content.cover.file.path, 'image/jpeg'])
    vk.wall.post(owner_id: ("-" + SERIALS_PUBLIC_ID), message: content.serial.title.mb_chars.capitalize + " #{content.serial.season} сезон." + " Добавлена #{content.number} серия", from_group: 1, attachments: Rails.application.routes.url_helpers.serial_url(content, host: 'waprik.org'))
    # vk_photo.gid = SERIALS_PUBLIC_ID
    # vk.photos.saveWallPhoto(vk_photo)
  end

end