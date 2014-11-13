class VideoConvertation

 	MP4_640 = "mp4_640"
  MP4_320 = "mp4_320"
  LOW_3GP = "low_3gp"
  
  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

	def video_options_for(version)
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


	# СЕРИАЛЫ
	def serial_to_mp4_640 file, file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{file.serie}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_640.mp4")
		movie = video.transcode(output_video_path, video_options_for(MP4_640), ASPECT_OPTIONS)
		file.size = movie.size
		file.format = FilmFormat.find_or_create_by_title("MP4 640 (хорошее качество)") # MP4 640 (хорошее качество)
		file.quality = FilmQuality.find(quality_id)
  	file.attach = File.open(output_video_path)
  	file.save
 		FileUtils.rm_rf(tmp_folder)
	end

	def serial_to_mp4_320 file, file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{file.serie}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_320.mp4")
		movie = video.transcode(output_video_path, video_options_for(MP4_320), ASPECT_OPTIONS)
		file.size = movie.size
		file.format = FilmFormat.find_by_title("MP4 320 (хорошее качество)") # MP4 320 (хорошее качество)
		file.quality = FilmQuality.find(quality_id)
  	file.attach = File.open(output_video_path)
  	file.save
 		FileUtils.rm_rf(tmp_folder)
	end

	def serial_to_3gp file, file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{file.serie}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}.3gp")
		movie = video.transcode(output_video_path, video_options_for(LOW_3GP), ASPECT_OPTIONS)
		file.size = movie.size
		file.format = FilmFormat.find_by_title("3GP (среднее качество)") # MP4 320 (хорошее качество)
		file.quality = FilmQuality.find(quality_id)
  	file.attach = File.open(output_video_path)
  	file.save
 		FileUtils.rm_rf(tmp_folder)
	end

	# ФИЛЬМЫ
  def film_to_mp4_640 film_file, file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{film_file.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_640.mp4")
		movie = video.transcode(output_video_path, video_options_for(MP4_640), ASPECT_OPTIONS)
		film_file.size = movie.size
		film_file.format = FilmFormat.find(8) # MP4 640 (хорошее качество)
		film_file.quality = FilmQuality.find(quality_id)
  	film_file.real_name = File.open(output_video_path)
  	save!
		# разрезать фильм на части
		start_sec = 0.second
		duration_sec = 1200.seconds
		part_num = 1
		while start_sec < movie.duration
			tmp_part = Rails.root.join(tmp_folder, "part#{part_num}.mp4")
			system "ffmpeg -ss #{Time.at(start_sec).utc.strftime("%H:%M:%S")} -i #{output_video_path} -t #{Time.at(duration_sec).utc.strftime("%H:%M:%S")} -c:v copy -c:a copy #{tmp_part}" 
			movie_part = FFMPEG::Movie.new(tmp_part) # чтобы узнать продолжительность duration && size
			part = film_file.film_parts.new
			part.num = part_num
			part.film = film_file.film
			part.real_name = File.open(tmp_part)
			part.size = movie_part.size
			part.duration = movie_part.duration
			part.save
			part_num += 1
			start_sec += duration_sec
			FileUtils.rm(tmp_part)
		end
 		FileUtils.rm_rf(tmp_folder)
  end

  def film_to_mp4_320 film_file, file_path, quality_id
		file_basename = File.basename(file_path)
		video = FFMPEG::Movie.new(file_path)
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{film_file.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_320.mp4")
		movie = video.transcode(output_video_path, video_options_for(MP4_320), ASPECT_OPTIONS)
		film_file.size = movie.size
		film_file.format = FilmFormat.find(7) # MP4 320 (хорошее качество)
  	film_file.real_name = File.open(output_video_path)
		film_file.quality = FilmQuality.find(quality_id)
  	save!
  	# разрезать фильм на части
		start_sec = 0.second
		duration_sec = 1200.seconds
		part_num = 1
		while start_sec < movie.duration
			tmp_part = Rails.root.join(tmp_folder, "part#{part_num}.mp4")
			system "ffmpeg -ss #{Time.at(start_sec).utc.strftime("%H:%M:%S")} -i #{output_video_path} -t #{Time.at(duration_sec).utc.strftime("%H:%M:%S")} -c:v copy -c:a copy #{tmp_part}" 
			movie_part = FFMPEG::Movie.new(tmp_part) # чтобы узнать продолжительность duration && size
			part = film_file.film_parts.new
			part.num = part_num
			part.film = film_file.film
			part.real_name = File.open(tmp_part)
			part.size = movie_part.size
			part.duration = movie_part.duration
			part.save
			part_num += 1
			start_sec += duration_sec
			FileUtils.rm(tmp_part)
		end
		FileUtils.rm_rf(tmp_folder)
  end

  def film_to_3gp film_file, file_path, quality_id
  	# конвертация
		file_basename = File.basename(file_path)
		video = FFMPEG::Movie.new(file_path)
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{film_file.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}.3gp")
		movie = video.transcode(output_video_path, video_options_for(LOW_3GP), ASPECT_OPTIONS)
		film_file.size = movie.size
		film_file.format = FilmFormat.find(1) # 3GP (среднее качество)
  	film_file.real_name = File.open(output_video_path)
		film_file.quality = FilmQuality.find(quality_id)
  	save!
		# разрезать фильм на части
		start_sec = 0.second
		duration_sec = 1200.seconds
		part_num = 1
		while start_sec < movie.duration
			tmp_part = Rails.root.join(tmp_folder, "part#{part_num}.3gp")
			system "ffmpeg -ss #{Time.at(start_sec).utc.strftime("%H:%M:%S")} -i #{output_video_path} -t #{Time.at(duration_sec).utc.strftime("%H:%M:%S")} -c:v copy -c:a copy #{tmp_part}" 
			movie_part = FFMPEG::Movie.new(tmp_part) # чтобы узнать продолжительность duration && size
			part = film_file.film_parts.new
			part.num = part_num
			part.film = film_file.film
			part.real_name = File.open(tmp_part)
			part.size = movie_part.size
			part.duration = movie_part.duration
			part.save
			part_num += 1
			start_sec += duration_sec
			FileUtils.rm(tmp_part)
		end
		FileUtils.rm_rf(tmp_folder)
  end 

end