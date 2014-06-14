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
  has_many :film_parts, foreign_key: 'file_id'

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
		# 	system "ffmpeg -ss #{start_sec} -i #{output_video_path} -t #{duration_sec} -c:v copy -c:a copy tmp/#{self.real_name}_part#{part_num}.mp4" 
		# 	part = self.film_parts.new
		# 	part.real_name = File.open("tmp/#{self.real_name}_part#{part_num}.mp4")
		# 	part.save
		# 	part_num += 1
		# 	start_sec += duration_sec
		# end
	 	# удалить временный файл
		FileUtils.rm_rf(tmp_folder)
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
		file_basename = File.basename(file_path)
		video = FFMPEG::Movie.new(file_path)
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/#{self.film.id}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}.3gp")
		movie = video.transcode(output_video_path, video_options_for(LOW_3GP), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find(1) # 3GP (среднее качество)
  	self.real_name = File.open(output_video_path)
  	save!
		FileUtils.rm_rf(tmp_folder)
  end 

	# def make_ffmpeg_movie_from file_path
	# 	@ffmpeg_video = FFMPEG::Movie.new(file_path)
	# 	sound = cut_sound_for(MP4_320)
	# 	video = cut_video_for(MP4_320)
	# 	output_path = create_output_video_from MP4_320, video, sound
	# 	self.real_name = File.open(output_path)
	# 	output_path
	# end

 	#  def audio_options_for(version)
	# 	if version == MP4_320
	# 		  options = {
	# 					 audio_codec: "libfaac", audio_bitrate: 64, audio_sample_rate: 44100, audio_channels: 2,
	# 		       threads: 0,
	# 		       custom: "-vn"}
	# 	elsif version == MP4_176
	# 		  options = {
	# 					 audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 44100, audio_channels: 2,
	# 		       threads: 0,
	# 		       custom: ""}
	# 	elsif version == LOW_3GP
	# 		  options = {
	# 					 audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 44100, audio_channels: 2,
	# 		       threads: 0,
	# 		       custom: "-vn"}
	# 	end
	# end

	#  Вырезать звук
	# def cut_sound_for(version)
	# 	if version == MP4_320
	# 		@ffmpeg_video.transcode(Rails.root.join(FTP_PATH, "320.m4a"), audio_options_for(MP4_320))
	# 	elsif version == MP4_176
	# 		@ffmpeg_video.transcode("#{path_for(version)}/cuted_sound_176.wav", { custom: "-vn -acodec copy" })
	# 	elsif version == LOW_3GP
	# 		@ffmpeg_video.transcode("#{path_for(version)}/cuted_sound_3gp.wav", { custom: "-vn -acodec copy" })
	# 	end
	# end

	#  Вырезать видео
	# def cut_video_for(version)
	# 	if version == MP4_320
	# 		@ffmpeg_video.transcode(Rails.root.join(FTP_PATH, "320.mp4"), video_options_for(MP4_320), ASPECT_OPTIONS) { |progress| puts progress }
	# 	elsif version == MP4_176
	# 		# @ffmpeg_video.transcode("#{path_for(version)}/cuted_video_176.mp4", { custom: "-an -vcodec copy" }) { |progress| puts progress }
	# 	elsif version == LOW_3GP
	# 		# @ffmpeg_video.transcode("#{path_for(version)}/cuted_video_3gp.mp4", { custom: "-an -vcodec copy" }) { |progress| puts progress }
	# 	end
	# end
	#  Видео + звук
	# def create_output_video_from(version, video, sound)
	# 	if version == MP4_320
	# 		output_video_path = Rails.root.join(FTP_PATH, "output.mp4")
	# 		video.transcode(output_video_path, {custom: "-itsoffset 00:00:00 -i #{sound.path}"})
	# 		# video.transcode(path_for(version) + "/320.mp4", { custom: "-i #{sound.path}" } ) { |progress| puts progress }
	# 		# system("ffmpeg -i \"#{path_for(version)}/video_320.mp4\" -itsoffset 00:00:01 -i \"#{path_for(version)}/sound_320.wav\"  \"#{path_for(version)}/final.mp4\"") { |progress| puts progress }
	# 		system("MP4Box -fps 23.976 -add #{video.path} -add #{sound.path} -new #{FTP_TMP_PATH} -tmp \"tmp\" ")
	# 		video.path
	# 	elsif version == MP4_176
	# 		system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound_176.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
	# 	elsif version == LOW_3GP
	# 		system("MP4Box -fps 15.000 -add \"#{path_for(version) + "/video_320.mp4"}\" -add \"#{path_for(version)}/sound_3gp.wav\" -new \"#{path_for(version)}/test_320.mp4\" -tmp \"#{path_for(version)}/temp\"")
	# 	end	
	# end
end
