module VideosHelper
  MP4_320 = "mp4_320"
  MP4_176 = "mp4_176"
  LOW_3GP = "low_3gp"

  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }
  
  def translit(name)
		# Беремя строку "name" и разбиваем ее на символы
		name.each_char.to_a.collect do |char|
			# Транслитируем найденные русские символы
				char = "a" if char == "а"
				char = "b" if char == "б"
				char = "v" if char == "в"
				char = "g" if char == "г" 
				char = "d" if char == "д" 
				char = "e" if char == "е"
				char = "yo" if char == "ё"
				char = "xh" if char == "ж"
				char = "z" if char == "з"
				char = "i" if char == "и"
				char = "j" if char == "й" 
				char = "k" if char == "к" 
				char = "l" if char == "л" 
				char = "m" if char == "м" 
				char = "n" if char == "н"
				char = "o" if char == "о"
				char = "p" if char == "п"
				char = "r" if char == "р"
				char = "s" if char == "с"
				char = "t" if char == "т"
				char = "u" if char == "у"
				char = "h" if char == "х"
				char = "f" if char == "ф"
				char = "c" if char == "ц"
				char = "ch" if char == "ср"
				char = "sh" if char == "ш"
				char = "w" if char == "щ"
				char = "qq" if char == "ъ"
				char = "u" if char == "у"
				char = "y" if char == "ы"
				char = "q" if char == "ь"
				char = "eh" if char == "э" 
				char = "yu" if char == "ю"
				char = "ya" if char == "я"
				char = "_" if char == "_"
		end
  end

	# Переименование файлов
  def remane(name)
  	name = translite(self.name)
  	@ffmpeg_video.transcode("#{path_for(version)}/video_320.mp4", {custom: "concat -i #{@marker}  -c copy "})
  end

	# Добавление видео сайта вначале
  def mark
  	@ffmpeg_video = FFMPEG::Movie.new("#{self.source_video.path}")
  	@ffmpeg_video.transcode("#{path_for(version)}/video_320.mp4", {custom: "concat -i #{@marker}  -c copy "})
  end

	# Опции для конвертации видео
	def video_options_for(version)
		if version == MP4_320
			  options = {video_codec: "libx264", frame_rate: 23.9, resolution: "320x240", video_bitrate: 300,
			       aspect: 1.777777,
			       # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4",
			       x264_vprofile: "baseline",
			       audio_codec: "copy", audio_bitrate: 64, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: "-filter:a aresample=44100"}
		elsif version == MP4_176
			  options = {video_codec: "libx264", frame_rate: 15, resolution: "176x144", video_bitrate: 150,
			       aspect: 1.333333,
			       # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4"
			       # audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: "-an"}
		elsif version == LOW_3GP
			  options = {video_codec: "libx264", frame_rate: 10, resolution: "320x240", video_bitrate: 300, video_bitrate_tolerance: 100,
			       aspect: 1.333333,
			       x264_vprofile: "high", x264_preset: "slow",
			       # audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 22050, audio_channels: 1,
			       threads: 2,
			       custom: "-filter:a aresample=44100"}
		end
	end

	# Опции для конвертации аудио
	def audio_options_for(version)
		if version == MP4_320
			  options = {
						 audio_codec: "libfaac", audio_bitrate: 64, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: "-vn"}
		elsif version == MP4_176
			  options = {
						 audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: ""}
		elsif version == LOW_3GP
			  options = {
						 audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: "-vn"}
		end
	end

	# Вырезать звук
	def cut_sound_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode("#{path_for(version)}/sound_320.wav", audio_options_for(MP4_320)) { |progress| puts progress }
		elsif version == MP4_176
			@ffmpeg_video.transcode("#{path_for(version)}/cuted_sound_176.wav", { custom: "-vn -acodec copy" })
		elsif version == LOW_3GP
			@ffmpeg_video.transcode("#{path_for(version)}/cuted_sound_3gp.wav", { custom: "-vn -acodec copy" })
		end
	end

	# Вырезать видео
	def cut_video_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode("#{path_for(version)}/video_320.mp4", video_options_for(MP4_320), ASPECT_OPTIONS) { |progress| puts progress }
		elsif version == MP4_176
			# @ffmpeg_video.transcode("#{path_for(version)}/cuted_video_176.mp4", { custom: "-an -vcodec copy" }) { |progress| puts progress }
		elsif version == LOW_3GP
			# @ffmpeg_video.transcode("#{path_for(version)}/cuted_video_3gp.mp4", { custom: "-an -vcodec copy" }) { |progress| puts progress }
		end
	end

	# Видео + звук
	def merge_video_and_sound_for(version, sound, video)
		if version == MP4_320
			@cuted_video.transcode("#{path_for(version)}/final.mp4", {custom: "-itsoffset 00:00:00 -i #{@cuted_sound.path}"}) { |progress| puts progress }
			# video.transcode(path_for(version) + "/320.mp4", { custom: "-i #{sound.path}" } ) { |progress| puts progress }
			# system("ffmpeg -i \"#{path_for(version)}/video_320.mp4\" -itsoffset 00:00:01 -i \"#{path_for(version)}/sound_320.wav\"  \"#{path_for(version)}/final.mp4\"") { |progress| puts progress }
			# system("MP4Box -fps 23.976 -add \"#{path_for(version)}/video_320.mp4\" -add \"#{path_for(version)}/sound_320.m4a\" -new \"#{path_for(version)}/final.mp4\" -tmp \"tmp\" ")
		elsif version == MP4_176
			system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound_176.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
		elsif version == LOW_3GP
			system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound_3gp.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
		end	
	end

	# Создание папок
	def create_folder_for(version)
		dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/tmp"
		FileUtils.chmod 0755, dir[0]
		if version == MP4_320
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}"
				FileUtils.chmod 0755, dir[0]
				return true
		elsif version == MP4_176
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}"
				FileUtils.chmod 0755, dir[0]
				return true
		elsif version == LOW_3GP
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}"
				FileUtils.chmod 0755, dir[0]
				return true
		end
	end

	# Пути к видео папкам
	def path_for(version)
		if version == MP4_320
				"#{Rails.root}/public/uploads/video/#{self.id}"
		elsif version == MP4_176
				"#{Rails.root}/public/uploads/video/#{self.id}"
		elsif version == LOW_3GP
				"#{Rails.root}/public/uploads/video/#{self.id}"
		elsif version == "final_video"
				"#{Rails.root}/public/uploads/video/#{self.id}/final.mp4"
		end
	end

end
