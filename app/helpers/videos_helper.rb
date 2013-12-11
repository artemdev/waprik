module VideosHelper
  MP4_320 = "mp4_320"
  MP4_176 = "mp4_176"
  LOW_3GP = "low_3gp"
  SOURCE_VIDEO_PATH = "source_video_path"
  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

	# Опции для конвертации видео
	def video_options_for(version)
		if version == MP4_320
			  options = {video_codec: "libx264", frame_rate: 23.9, resolution: "320x240", video_bitrate: 300,
			       aspect: 1.777777,
			       # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4",
			       # audio_codec: "libfaac", audio_bitrate: 64, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: ""}
		elsif version == MP4_176
			  options = {video_codec: "libx264", frame_rate: 15, resolution: "176x144", video_bitrate: 150,
			       aspect: 1.333333,
			       # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4"
			       # audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: ""}
		elsif version == LOW_3GP
			  options = {video_codec: "libx264", frame_rate: 10, resolution: "320x240", video_bitrate: 300, video_bitrate_tolerance: 100,
			       aspect: 1.333333,
			       x264_vprofile: "high", x264_preset: "slow",
			       # audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 22050, audio_channels: 1,
			       threads: 2,
			       custom: ""}
		end
	end

	# Вырезание звука из видео
	def cut_sound_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode("#{path_for(version)}/tmp_sound.wav", { custom: "-vn -acodec copy" })
		elsif version == MP4_176
			@ffmpeg_video.transcode("#{path_for(version)}/tmp_sound.wav", { custom: "-vn -acodec copy" })
		elsif version == LOW_3GP
			@ffmpeg_video.transcode("#{path_for(version)}/tmp_sound.wav", { custom: "-vn -acodec copy" })
		end
	end

	# Подготовка видео без звука
	def cut_video_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode("#{path_for(version)}/tmp_video.mp4", { custom: "-an -vcodec copy" })
		elsif version == MP4_176
			@ffmpeg_video.transcode("#{path_for(version)}/tmp_video.mp4", { custom: "-an -vcodec copy" })
		elsif version == LOW_3GP
			@ffmpeg_video.transcode("#{path_for(version)}/tmp_video.mp4", { custom: "-an -vcodec copy" })
		end
	end

	# Конвертация звука
	def convert_audio_for(version)
		if version == MP4_320
					system("neroAacEnc -2pass -br 64000 -lc -if \"#{path_for(version)}/tmp_sound.wav\" -of \"#{path_for(version)}/sound.m4a\"")
		elsif version == MP4_176
					system("ffmpeg -i input -f \"#{path_for(version)}/tmp_sound.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
		elsif version == LOW_3GP
					system("ffmpeg -i input -f \"#{path_for(version)}/tmp_sound.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
		end
	end 


	# Конвертация видео
	def convert_video_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode((path_for(version) + "/video_320.mp4"), video_options_for(version), ASPECT_OPTIONS)
		elsif version == MP4_176
			@ffmpeg_video.transcode((path_for(version) + "/video_176.mp4"), video_options_for(version), ASPECT_OPTIONS)
		elsif version == LOW_3GP
			@ffmpeg_video.transcode((path_for(version) + "/video_low.3gp"), video_options_for(version), ASPECT_OPTIONS)
		end			
	end

	# Соединение видео и звука
	def merge_video_and_sound_for(version)
		if version == MP4_320
					system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound.m4a\" -new \"#{path_for(version)}/test_320.mp4\"")
		elsif version == MP4_176
					system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/tmp_sound.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
		elsif version == LOW_3GP
					system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/tmp_sound.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
		end	
	end

	# Создание папок для видео
	def create_folder_for(version)
		if version == MP4_320
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/mp4_320"
				FileUtils.chmod 0755, dir[0]
				return true
		elsif version == MP4_176
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/mp4_176"
				FileUtils.chmod 0755, dir[0]
				return true
		elsif version == LOW_3GP
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/low_3gp"
				FileUtils.chmod 0755, dir[0]
				return true
		end
	end

	# Пути к видео папкам
	def path_for(version)
		if version == MP4_320
				"#{Rails.root}/public/uploads/video/#{self.id}/mp4_320"
		elsif version == MP4_176
				"#{Rails.root}/public/uploads/video/#{self.id}/mp4_176"
		elsif version == LOW_3GP
				"#{Rails.root}/public/uploads/video/#{self.id}/low_3gp"
		elsif version == SOURCE_VIDEO_PATH
				"#{Rails.root}/public/#{@source_video.url}"
		end
	end

end
