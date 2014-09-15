module Convertation
 	MP4_640 = "mp4_640"
  MP4_320 = "mp4_320"
  LOW_3GP = "low_3gp"
  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

	  def self.to_3gp object, file_path, quality_id
			video = FFMPEG::Movie.new(file_path)
			file_basename = File.basename(file_path, ".mp4")
			tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{object.serie}")).first
			output_video_path = Rails.root.join(tmp_folder, "#{file_basename}.3gp")
			movie = video.transcode(output_video_path, video_options_for(LOW_3GP), ASPECT_OPTIONS)
			object.size = movie.size
			object.format = FilmFormat.find_by_title("3GP (среднее качество)") # MP4 320 (хорошее качество)
			object.quality = FilmQuality.find(quality_id)
	  	object.attach = File.open(output_video_path)
	  	object.save
	 		FileUtils.rm_rf(tmp_folder)
	  end

		def self.video_options_for(version)
			if version == MP4_640
				  options = {
				  		video_codec: "libx264", frame_rate: 23.9, resolution: "640x320", video_bitrate: 350,
				       x264_vprofile: "baseline",
				       audio_codec: "libfaac", audio_bitrate: 95, audio_sample_rate: 44100, audio_channels: 2,
				       threads: 2,
				       custom: "-filter:a aresample=44100 -vf scale=640:-1"}
			elsif version == MP4_320
				  options = {video_codec: "libx264", frame_rate: 15, resolution: "320x240", video_bitrate: 200,
				       x264_vprofile: "baseline",
				       audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 44100, audio_channels: 2,
				       threads: 2,
				       custom: "-filter:a aresample=44100 -vf scale=320:-1"}
			elsif version == LOW_3GP
				  options = {video_codec: "libx264", frame_rate: 15, resolution: "176x144", video_bitrate: 120,
				       x264_vprofile: "baseline",
				       audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 44100, audio_channels: 1,
				       threads: 2,
				       custom: "-filter:a aresample=44100 -vf scale=176:-1"}
			end
		end

		# Конвертация видео
	  def self.to_mp4_640 object, file_path, quality_id
			video = FFMPEG::Movie.new(file_path)
			file_basename = File.basename(file_path, ".mp4")
			tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{object.serie}")).first
			output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_640.mp4")
			movie = video.transcode(output_video_path, video_options_for(MP4_640), ASPECT_OPTIONS)
			object.size = movie.size
			object.format = FilmFormat.find_by_title("MP4 640 (хорошее качество)") # MP4 640 (хорошее качество)
			object.quality = FilmQuality.find(quality_id)
	  	object.attach = File.open(output_video_path)
	  	object.save
	 		FileUtils.rm_rf(tmp_folder)
	  end

	  def self.to_mp4_320 object, file_path, quality_id
			video = FFMPEG::Movie.new(file_path)
			file_basename = File.basename(file_path, ".mp4")
			tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{object.serie}")).first
			output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_320.mp4")
			movie = video.transcode(output_video_path, video_options_for(MP4_320), ASPECT_OPTIONS)
			object.size = movie.size
			object.format = FilmFormat.find_by_title("MP4 320 (хорошее качество)") # MP4 320 (хорошее качество)
			object.quality = FilmQuality.find(quality_id)
	  	object.attach = File.open(output_video_path)
	  	object.save
	 		FileUtils.rm_rf(tmp_folder)
	  end

end