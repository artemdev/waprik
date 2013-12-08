require 'streamio-ffmpeg'
class Video < ActiveRecord::Base

  attr_accessible :name, :screen, :description, :category_id, :collection, :artist, :source_video
  attr_accessor :collection


  has_and_belongs_to_many :categories
  has_and_belongs_to_many :collections

  validates :name, presence: true, length: { minimum: 5, maximum: 100}
  # validates_presence_of :screen
  # validates_presence_of :low_3gp
  # validates_presence_of :mp4_176
  # validates_presence_of :mp4_320

  mount_uploader :screen, ScreenUploader
  mount_uploader :low_3gp, VideosUploader
  mount_uploader :mp4_176, VideosUploader
  mount_uploader :mp4_320, VideosUploader
  mount_uploader :source_video, VideosUploader

  after_create :convert
  before_destroy :remember_id
  after_destroy :remove_id_directory

  scope :sorted, order("created_at DESC")

  # Добавление видео в коллекцию
  def add_to_collection 
    unless collection.empty?
      # Указанное имя подборки существует или его нужно создать ?
      if Collection.where(:name => collection.downcase) != []
        coll = Collection.find_by_name(collection.downcase)
      else
        coll = Collection.create(:name => collection.downcase)      
      end
      # Проверяем чтобы небыло одинаковых подборок к одному видео
      self.collections.each do |video_collection|
          if coll.name == video_collection.name
            @collection_exists = video_collection
          end
      end
      # Если такой подборки у видео нет, сохраняем ее
      if @collection_exists
        return true
      else
        self.collections << coll
      end
      return self.collections
    end
    return false
  end

  

  protected

  # Конвертация видео
  def convert
    unless self.source_video.blank? && self.mp4_320.blank? && self.mp4_176.blank? && self.low_3gp.blank?
      original_video = FFMPEG::Movie.new("#{source_video.path}")
      # options_for_mp4_320 = { custom: "-s 320x240 -vcodec libx264 -profile:v baseline -level 3.0 -acodec libfaac -threads 0 -ab 64k -b 320k" }
      # options_for_mp4_176 = { custom: "-s 320x240 -vcodec libx264 -profile:v baseline -level 3.0 -acodec libfaac -threads 0 -ab 32k -b 150k" }
      # options_for_3gp     = { custom: "-s 320x240 -vcodec libx264 -profile:v baseline -level 3.0 -acodec libfaac -threads 0 -ab 32k -b 100k" }
      
      transcoder_options = { preserve_aspect_ratio: :width }
      options_for_mp4_320 = {video_codec: "libx264", frame_rate: 23.9, resolution: "320x240", video_bitrate: 300,
           aspect: 1.333333,
           # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4",
           audio_codec: "libfaac", audio_bitrate: 64, audio_sample_rate: 41000, audio_channels: 2,
           threads: 0,
           custom: ""}
      options_for_mp4_176 = {video_codec: "libx264", frame_rate: 15, resolution: "176x144", video_bitrate: 150,
           aspect: 1.333333,
           # x264_preset: "#{Rails.root}/public/video_preset/treiler_320.mp4"
           audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 41000, audio_channels: 2,
           threads: 0,
           custom: ""}
      # options_for_3gp = {video_codec: "libx264", frame_rate: 10, resolution: "320x240", video_bitrate: 300, video_bitrate_tolerance: 100,
      #      aspect: 1.333333, keyframe_interval: 90,
      #      x264_vprofile: "high", x264_preset: "slow",
      #      audio_codec: "libfaac", audio_bitrate: 32, audio_sample_rate: 22050, audio_channels: 1,
      #      threads: 2,
      #      custom: ""}


      FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{id}/mp4_320"
      FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{id}/mp4_176"
      # FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{id}/low_3gp"

      path_mp4_320 = "#{Rails.root}/public/uploads/video/#{id}/mp4_320"
      path_mp4_176 = "#{Rails.root}/public/uploads/video/#{id}/mp4_176"
      # path_3gp     = "#{Rails.root}/public/uploads/video/#{id}/low_3gp"


      # mp4_320 = original_video.transcode(Rails.root.join(path_mp4_320, "#{self.name}_320.mp4"), options_for_mp4_320)
      # mp4_176 = original_video.transcode(Rails.root.join(path_mp4_176, "#{self.name}_176.mp4"), options_for_mp4_176)
      # low_3gp = original_video.transcode(Rails.root.join(path_3gp,     "#{self.name}.3gp"),     options_for_3gp)

      self.mp4_320 = original_video.transcode(Rails.root.join(path_mp4_320, "#{self.name}_320.mp4"), options_for_mp4_320, transcoder_options)
      self.mp4_176 = original_video.transcode(Rails.root.join(path_mp4_176, "#{self.name}_176.mp4"), options_for_mp4_176, transcoder_options)
      # self.low_3gp = original_video.transcode(Rails.root.join(path_3gp,     "#{self.name}.3gp"),     options_for_3gp, transcoder_options)

      save
      # FileUtils.rm_r(CarrierWave.clean_cached_files!)
    end
  end

  def source_video_exists
    unless self.source_video != nil && self.source_video.blank?
    else
      false
    end
  end

  # Конвертирация исходного видео


  # Удаление файлов
  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/video/#{@id}", :force => true)
  end
end
