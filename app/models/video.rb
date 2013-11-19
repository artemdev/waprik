class Video < ActiveRecord::Base
  attr_accessible :name, :screen, :low_3gp, :mp4_176, :mp4_320, :description, :category_id, :collection, :artist
  attr_accessor :collection

### Переменные для палингации ###

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :collections

  # validates_presence_of :name
  # validates_length_of :name, :maximum => 100
  # validates_presence_of :screen
  # validates_presence_of :low_3gp
  # validates_presence_of :mp4_176
  # validates_presence_of :mp4_320

  mount_uploader :screen, ScreenUploader
  mount_uploader :low_3gp, VideosUploader
  mount_uploader :mp4_176, VideosUploader
  mount_uploader :mp4_320, VideosUploader

  before_destroy :remember_id
  after_destroy :remove_id_directory

  scope :sorted, order("created_at DESC")

  def add_collection (video)
    unless collection.empty?
      if Collection.where(:name => collection.downcase) != []
        coll = Collection.find_by_name(collection.downcase)
      else
        coll = Collection.create(:name => collection.downcase)      
      end
      video.collections.each do |video_collection|
          if coll.name == video_collection.name
            @collection_exists = video_collection
          end
      end
      if @collection_exists
        
      else
        video.collections << coll
      end
      return video.collections
    end
  end

  protected

  def remember_id
    @id = id
  end

  def remove_id_directory
    FileUtils.remove_dir("#{Rails.root}/public/uploads/video/#{@id}", :force => true)
  end
end
