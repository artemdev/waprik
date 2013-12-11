module VideosHelper
  MP4_320 = "mp4_320"
  MP4_176 = "mp4_176"
  LOW_3GP = "low_3gp"

  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

	# Опции для конвертации видео
	def video_options_for(version)
		if version == MP4_320
			  options = {video_codec: "libx264", frame_rate: 23.9, resolution: "320x240", video_bitrate: 300,
			       aspect: 1.777777,
			       # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4",
			       x264_vprofile: "baseline",
			       # audio_codec: "libfaac", audio_bitrate: 64, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: ""}
		elsif version == MP4_176
			  options = {video_codec: "libx264", frame_rate: 15, resolution: "176x144", video_bitrate: 150,
			       aspect: 1.333333,
			       # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4"
			       # audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 41000, audio_channels: 2,
			       threads: 0,
			       custom: "-filter:a aresample=44100"}
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
			       custom: ""}
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

	# Звук
	def cut_sound_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode("#{path_for(version)}/sound_320.wav", audio_options_for(MP4_320)) { |progress| puts progress }
		elsif version == MP4_176
			@ffmpeg_video.transcode("#{path_for(version)}/cuted_sound_176.wav", { custom: "-vn -acodec copy" })
		elsif version == LOW_3GP
			@ffmpeg_video.transcode("#{path_for(version)}/cuted_sound_3gp.wav", { custom: "-vn -acodec copy" })
		end
	end

	# Видео
	def cut_video_for(version)
		if version == MP4_320
			@ffmpeg_video.transcode("#{path_for(version)}/video_320.mp4", video_options_for(MP4_320), ASPECT_OPTIONS) { |progress| puts progress }
		elsif version == MP4_176
			@ffmpeg_video.transcode("#{path_for(version)}/cuted_video_176.mp4", { custom: "-an -vcodec copy" }) { |progress| puts progress }
		elsif version == LOW_3GP
			@ffmpeg_video.transcode("#{path_for(version)}/cuted_video_3gp.mp4", { custom: "-an -vcodec copy" }) { |progress| puts progress }
		end
	end

	# # Конвертация звука
	# def convert_audio_for(version)
	# 	if version == MP4_320
	# 				system"neroAacEnc.exe -2pass -br 64000 -lc -if #{@cuted_sound.path} -of \"#{path_for(version)}/sound_320.m4a\""
	# 				File.open("#{path_for(version)}/sound_320.m4a")
	# 				# @cuted_sound.transcode("#{path_for(version)}/sound_320.m4a", audio_options_for(version)) { |progress| puts progress }
	# 	elsif version == MP4_176
	# 				system("ffmpeg -i input -f \"#{path_for(version)}/sound_176.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
	# 	elsif version == LOW_3GP
	# 				system("ffmpeg -i input -f \"#{path_for(version)}/sound_3gp.wav\" - | neroAacEnc -ignorelength -if - -of \"#{path_for(version)}/sound.m4a\"")
	# 	end
	# end 

	# Конвертация видео
	def convert_video_for(version)
		if version == MP4_320
			#@ffmpeg_video.transcode("#{path_for(version)}/video_320.mp4", video_options_for(MP4_320), ASPECT_OPTIONS) { |progress| puts progress }
			@cuted_video.transcode("#{path_for(version)}/video_320.mp4",  video_options_for(version), ASPECT_OPTIONS) { |progress| puts progress }
		elsif version == MP4_176
			@ffmpeg_video.transcode("#{path_for(version)}/video_176.mp4", video_options_for(version), ASPECT_OPTIONS) { |progress| puts progress }
		elsif version == LOW_3GP
			@ffmpeg_video.transcode("#{path_for(version)}/video_3gp.3gp", video_options_for(version), ASPECT_OPTIONS) { |progress| puts progress }
		end			
	end

	# Видео + звук
	def merge_video_and_sound_for(version, sound, video)
		if version == MP4_320
			@cuted_video.transcode("#{path_for(version)}/final.mp4", {custom: "-itsoffset 00:00:01 -i \"#{path_for(version)}/sound_320.wav\""}) { |progress| puts progress }
			# video.transcode(path_for(version) + "/320.mp4", { custom: "-i #{sound.path}" } ) { |progress| puts progress }
			# system("ffmpeg -i \"#{path_for(version)}/video_320.mp4\" -itsoffset 00:00:01 -i \"#{path_for(version)}/sound_320.wav\"  \"#{path_for(version)}/final.mp4\"") { |progress| puts progress }
			# system("MP4Box -fps 23.976 -add \"#{path_for(version)}/video_320.mp4\" -add \"#{path_for(version)}/sound_320.m4a\" -new \"#{path_for(version)}/final.mp4\" -tmp \"tmp\" ")
		elsif version == MP4_176
			system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound_176.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
		elsif version == LOW_3GP
			system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound_3gp.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
		end	
	end

	# Создание папок для видео
	def create_folder_for(version)
		if version == MP4_320
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}"
				FileUtils.chmod 0755, dir[0]
				dir = FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{self.id}/tmp"
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
