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
      options_for_mp4_320 = { custom: "-ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y" }
      options_for_mp4_176 = { custom: "-ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y" }
      options_for_3gp     = { custom: "-ar 22050 -ab 32 -s 480x360 -vcodec flv -r 25 -qscale 8 -f flv -y" }

      FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{id}/mp4_320"
      FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{id}/mp4_176"
      FileUtils.mkdir_p "#{Rails.root}/public/uploads/video/#{id}/low_3gp"

      path_mp4_320 = "#{Rails.root}/public/uploads/video/#{id}/mp4_320"
      path_mp4_176 = "#{Rails.root}/public/uploads/video/#{id}/mp4_176"
      path_3gp     = "#{Rails.root}/public/uploads/video/#{id}/low_3gp"


      # mp4_320 = original_video.transcode(Rails.root.join(path_mp4_320, "#{self.name}_320.mp4"), options_for_mp4_320)
      # mp4_176 = original_video.transcode(Rails.root.join(path_mp4_176, "#{self.name}_176.mp4"), options_for_mp4_176)
      # low_3gp = original_video.transcode(Rails.root.join(path_3gp,     "#{self.name}.3gp"),     options_for_3gp)

      self.mp4_320 = original_video.transcode(Rails.root.join(path_mp4_320, "#{self.name}_320.mp4"), options_for_mp4_320)
      self.mp4_176 = original_video.transcode(Rails.root.join(path_mp4_176, "#{self.name}_176.mp4"), options_for_mp4_176)
      self.low_3gp = original_video.transcode(Rails.root.join(path_3gp,     "#{self.name}.3gp"),     options_for_3gp)

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
