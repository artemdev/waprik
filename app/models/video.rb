# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  category_id  :integer
#  description  :string(255)
#  screen       :string(255)
#  low_3gp      :string(255)
#  mp4_320      :string(255)
#  size         :integer
#  name         :string(255)
#  artist       :string(255)
#  downloads    :integer          default(0)
#  source_video :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mp4_640      :string(255)
#  published_at :datetime
#

class Video < ActiveRecord::Base
  def to_param
    "#{id}-#{name}"
  end

  attr_accessible :name, :screen, :description, :category_id, :collection, :artist, :source_video, :ftp_mp4_320, :ftp_low_3gp, :ftp_mp4_640
  attr_accessor :collection, :ftp_mp4_320, :ftp_low_3gp, :ftp_mp4_640


  has_and_belongs_to_many :categories
  has_and_belongs_to_many :collections

  has_many :files, class_name: "VideFile"

  validates :name, presence: true, length: { minimum: 5, maximum: 100}
  # validates_presence_of :screen
  # validates_presence_of :low_3gp
  # validates_presence_of :mp4_176
  # validates_presence_of :mp4_320

  mount_uploader :screen, CoverUploader

  # before_create :mark
  # after_create :convert
  # before_create :mark
  # before_create :rename_file
  after_save :remove_chached_files
  before_destroy :remember_id
  after_destroy :remove_id_directory

  scope :sorted, order("updated_at DESC")
  scope :latest, order("created_at DESC")
  scope :today, where('DATE(created_at) = ?', Date.today)

  # Добавление видео в коллекцию
  def add_to_collection 
    unless collection.empty?
      # Указанное имя подборки существует или его нужно создать ?
      if Collection.where(name: collection.downcase, with_videos: true) != []
        coll = Collection.find_by_name(collection.downcase)
      else
        coll = Collection.create(name: collection.downcase, with_videos: true)
      end
      # Проверяем чтобы небыло одинаковых подборок к одному видео
      unless self.collections.empty?
            self.collections.each do |video_collection|
            if coll.name == video_collection.name
              @collection_exists = video_collection
            end
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
      @ffmpeg_video = FFMPEG::Movie.new("#{self.source_video.path}")

      # Создание папок для готовых видео
      create_folder_for(MP4_320)
      # create_folder_for(MP4_176)
      # create_folder_for(LOW_3GP)

      # Вырезание звука
      # @cuted_sound = cut_sound_for(MP4_320)
      # cut_sound_for(MP4_176)
      # cut_sound_for(LOW_3GP)

      # Вырезание видео
      # @cuted_video = cut_video_for(MP4_320)
      # cut_video_for(MP4_176)
      # cut_video_for(LOW_3GP)

      # Соеденить видео и звук
      self.mp4_320.store!(cut_video_for(MP4_320))
      # self.mp4_176 = original_video.transcode(Rails.root.join(path_mp4_176, "#{self.name}_176.mp4"), options_for_mp4_176, transcoder_options)
      # self.low_3gp = original_video.transcode(Rails.root.join(path_3gp,     "#{self.name}.3gp"),     options_for_3gp, transcoder_options)

      save!
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

  # Удаление cache файлов
  def remove_chached_files
    FileUtils.rm_r(CarrierWave.clean_cached_files!)
  end

  # Удаление файлов
  def remember_id
    @id = self.id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/video/#{@id}", :force => true)
  end
end
