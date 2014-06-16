# integer "film_id"
# integer "format_id"
# string  "title"
# string  "real_name"
# integer "size"
# string  "ext"
# string  "file"
# integer "position"
class FilmFile < ActiveRecord::Base
  self.table_name = "films_files"
	attr_accessible :new_file, :format_title

	FTP_TMP_PATH = "public/output.mp4"
 	MP4_640 = "mp4_640"
  MP4_320 = "mp4_320"
  LOW_3GP = "low_3gp"
  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

	mount_uploader :real_name, FilmFileUploader

	belongs_to :film
	belongs_to :format, class_name: "FilmFormat"
  has_many :film_parts, foreign_key: 'file_id', dependent: :destroy

	# validates :real_name, presence: true

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


	# Конвертация видео
  def convert_to_mp4_640 file_path
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{self.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_640.mp4")
		movie = video.transcode(output_video_path, video_options_for(MP4_640), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find(8) # MP4 640 (хорошее качество)
  	self.real_name = File.open(output_video_path)
  	save!
		# разрезать фильм на части
		# находим правельные старты для каждой версии
		# start_sec = 0
		# duration_sec = 1800
		# part_num = 1
		# while Time.parse(start_sec) < movie.duration
		# 	system "ffmpeg -ss #{start_sec} -i #{output_video_path} -t #{duration_sec} -c:v copy -c:a copy tmp/#{self.film.title}_part#{part_num}.mp4" 
		# 	part = self.film_parts.new
		# 	part.real_name = File.open("tmp/#{self.real_name}_part#{part_num}.mp4")
 
  end

  def convert_to_mp4_320 file_path
		file_basename = File.basename(file_path)
		video = FFMPEG::Movie.new(file_path)
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{self.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_320.mp4")
		movie = video.transcode(output_video_path, video_options_for(MP4_320), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find(7) # MP4 320 (хорошее качество)
  	self.real_name = File.open(output_video_path)
  	save!
		FileUtils.rm_rf(tmp_folder)
  end

  def convert_to_3gp file_path
  	# конвертация
		file_basename = File.basename(file_path)
		video = FFMPEG::Movie.new(file_path)
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{self.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}.3gp")
		movie = video.transcode(output_video_path, video_options_for(LOW_3GP), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find(1) # 3GP (среднее качество)
  	self.real_name = File.open(output_video_path)
  	save!
		# разрезать фильм на части
		start_sec = 0.second
		duration_sec = 300.seconds
		part_num = 1
		while start_sec < movie.duration
			tmp_part = Rails.root.join(tmp_folder, "part#{part_num}.3gp")
			system "ffmpeg -ss #{Time.at(start_sec).utc.strftime("%H:%M:%S")} -i #{output_video_path} -t #{Time.at(duration_sec).utc.strftime("%H:%M:%S")} -c:v copy -c:a copy #{tmp_part}" 
			movie_part = FFMPEG::Movie.new(tmp_part) # чтобы узнать продолжительность duration && size
			part = self.film_parts.new
			part.num = part_num
			part.film = self.film
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
