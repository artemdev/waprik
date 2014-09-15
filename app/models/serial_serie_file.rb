# == Schema Information
#
# Table name: serial_serie_files
#
#  id         :integer          not null, primary key
#  serie_id   :integer
#  quality_id :integer
#  format_id  :integer
#  attach     :string(255)
#  size       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  downloads  :integer          default(0)
#

class SerialSerieFile < ActiveRecord::Base
  attr_accessible :attach, :format_id, :quality_id

 	MP4_640 = "mp4_640"
  MP4_320 = "mp4_320"
  LOW_3GP = "low_3gp"
  
  ASPECT_OPTIONS = { preserve_aspect_ratio: :width }

  mount_uploader :attach, SerialsUploader

  belongs_to :serie, class_name: "Series"
  belongs_to :quality, class_name: "FilmQuality"
  belongs_to :format, class_name: "FilmFormat"
  validates :quality, :serie, :format, presence: true

  # def after_initialize format=nil, file_path=nil, quality_id=nil
		# Convertation.to_low_3gp self, file_path, quality_id if format && format == LOW_3GP
		# Convertation.to_mp4_320 self, file_path, quality_id if format && format == MP4_320
		# Convertation.to_mp4_640 self, file_path, quality_id if format && format == MP4_640
		# true
  # end

	def video_options_for(version)
		if version == FORMAT_MP4_640
			  options = {
			  		video_codec: "libx264", frame_rate: 23.9, resolution: "640x320", video_bitrate: 350,
			       x264_vprofile: "baseline",
			       audio_codec: "libfaac", audio_bitrate: 95, audio_sample_rate: 44100, audio_channels: 2,
			       threads: 2,
			       custom: "-filter:a aresample=44100 -vf scale=640:-1"}
		elsif version == FORMAT_MP4_320
			  options = {video_codec: "libx264", frame_rate: 15, resolution: "320x240", video_bitrate: 200,
			       x264_vprofile: "baseline",
			       audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 44100, audio_channels: 2,
			       threads: 2,
			       custom: "-filter:a aresample=44100 -vf scale=320:-1"}
		elsif version == FORMAT_LOW_3GP
			  options = {video_codec: "libx264", frame_rate: 15, resolution: "176x144", video_bitrate: 120,
			       x264_vprofile: "baseline",
			       audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 44100, audio_channels: 1,
			       threads: 2,
			       custom: "-filter:a aresample=44100 -vf scale=176:-1"}
		end
	end

	# Конвертация видео
  def convert_to_mp4_640 file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{self.serie}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_640.mp4")
		movie = video.transcode(output_video_path, video_options_for(FORMAT_MP4_640), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find_by_title("MP4 640 (хорошее качество)") # MP4 640 (хорошее качество)
		self.quality = FilmQuality.find(quality_id)
  	self.attach = File.open(output_video_path)
  	save
 		FileUtils.rm_rf(tmp_folder)
  end

  def convert_to_mp4_320 file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{self.serie}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}_320.mp4")
		movie = video.transcode(output_video_path, video_options_for(FORMAT_MP4_320), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find_by_title("MP4 320 (хорошее качество)") # MP4 320 (хорошее качество)
		self.quality = FilmQuality.find(quality_id)
  	self.attach = File.open(output_video_path)
  	save
 		FileUtils.rm_rf(tmp_folder)
  end

  def convert_to_3gp file_path, quality_id
		video = FFMPEG::Movie.new(file_path)
		file_basename = File.basename(file_path, ".mp4")
		tmp_folder = FileUtils.mkdir_p(Rails.root.join("public/uploads/tmp/series/#{self.serie}")).first
		output_video_path = Rails.root.join(tmp_folder, "#{file_basename}.3gp")
		movie = video.transcode(output_video_path, video_options_for(FORMAT_LOW_3GP), ASPECT_OPTIONS)
		self.size = movie.size
		self.format = FilmFormat.find_by_title("3GP (среднее качество)") # MP4 320 (хорошее качество)
		self.quality = FilmQuality.find(quality_id)
  	self.attach = File.open(output_video_path)
  	save
 		FileUtils.rm_rf(tmp_folder)
  end

end
