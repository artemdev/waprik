module VideosHelper
  MP4_320 = "mp4_320"
  MP4_176 = "mp4_176"
  LOW_3GP = "low_3gp"

  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

	# Опции для конвертации видео
	def video_options_for(version)
		if version == MP4_320
			  options = {video_codec: "libx264", frame_rate: 23.9, resolution: "320x240", video_bitrate: 300,
			       aspect: 1.333333,
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

	# Вырезаем звук c помощью (ffmpeg)
	def cut_sound_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode(@source_video.path, { custom: "-vn -acodec copy #{path_for(version)}/tmp_sound.wav" })
		elsif version == MP4_176
			@ffmpeg_video.transcode(@source_video.path, { custom: "-vn -acodec copy #{path_for(version)}/tmp_sound.wav" })
		elsif version == LOW_3GP
			@ffmpeg_video.transcode(@source_video.path, { custom: "-vn -acodec copy #{path_for(version)}/tmp_sound.wav" })
		end
	end

	# Готовим видео без звука (ffmpeg)
	def cut_video_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode(@source_video.path, { custom: "-an -vcodec copy #{path_for(version)}/video.264" })
		elsif version == MP4_176
			@ffmpeg_video.transcode(@source_video.path, { custom: "-an -vcodec copy #{path_for(version)}/video.264" })
		elsif version == LOW_3GP
			@ffmpeg_video.transcode(@source_video.path, { custom: "-an -vcodec copy #{path_for(version)}/video.264" })
		end
	end

	# Конвертация звука (NeroAac)
	def convert_audio_for(version)
		if version == MP4_320
					system("ffmpeg -i input -f \"#{path_for(version)}/tmp_sound.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
		elsif version == MP4_176
					system("ffmpeg -i input -f \"#{path_for(version)}/tmp_sound.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
		elsif version == LOW_3GP
					system("ffmpeg -i input -f \"#{path_for(version)}/tmp_sound.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
		end
	end 


	# Конвертация видео
	def convert_video_for(version)
		if version == MP4_320
			output_video = @ffmpeg_video.transcode((path_for(version) + "/video_320.mp4"), video_options_for(version), ASPECT_OPTIONS)
		elsif version == MP4_176
			output_video = @ffmpeg_video.transcode((path_for(version) + "/video_176.mp4"), video_options_for(version), ASPECT_OPTIONS)
		elsif version == LOW_3GP
			output_video = @ffmpeg_video.transcode((path_for(version) + "/video_low.3gp"), video_options_for(version), ASPECT_OPTIONS)
		end			
	end

	# Склеиваем звук и видео (MP4Box)
	def merge_video_and_sound(version)
		if version == MP4_320
					system("MP4Box.exe: -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound.m4a\" -new \"test_320.mp4\" -tmp \"temp\"")
		elsif version == MP4_176
					system("MP4Box.exe: -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound.m4a\" -new \"test_320.mp4\" -tmp \"temp\"")
		elsif version == LOW_3GP
					system("MP4Box.exe: -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound.m4a\" -new \"test_320.mp4\" -tmp \"temp\"")
		end	
	end

	# Создание папок для видео
	def create_folder_for(version)
		if version == "mp4_320"
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/mp4_320"
				FileUtils.chmod 0755, dir[0]
				return true
		elsif version == "mp4_176"
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/mp4_176"
				FileUtils.chmod 0755, dir[0]
				return true
		elsif version == "low_3gp"
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
		end
	end

end
