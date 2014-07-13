# string    "ftp_path",          :limit => 256,                     
# string    "path",              :limit => 256,                     
# string    "name",              :limit => 256,                     
# string    "fname",             :limit => 256,                     
# string    "length",            :limit => 5,   :default => "00:00",
# timestamp "created_at",                                           
# integer   "genre_id",                                             
# integer   "artist_id",                        :default => 0,      
# integer   "album_id",                         :default => 0,      
# integer   "order",                                                
# integer   "order_nomination",                 :default => 0,      
# string    "hit",               :limit => 1,   :default => "0",    
# timestamp "file_hit_date"
# string    "new",               :limit => 1,   :default => "0",    
# integer   "downloads",                       :default => 0,      
require 'taglib'
class Mp3File < ActiveRecord::Base
  attr_accessible :name, :path, :new_path, :artist_name, :album_name, :new_file
  attr_accessor :new_file

  ID3v2_ALBUM = "waprik.ru - новая музыка"

  before_create :save_file_length
  before_create :create_permalink

  mount_uploader :path, Mp3Uploader
  mount_uploader :new_path, MusicUploader

  has_many :bitrates, class_name: 'Mp3Bitrate', foreign_key: 'file_id'
  belongs_to :artist, class_name: 'Mp3Artist'
  belongs_to :album, class_name: 'Mp3Album'
  belongs_to :news, class_name: 'News', foreign_key: 'news_id'

  scope :latest, order("created_at DESC")
  scope :published_at, lambda { |date = nil | where("created_at > ? AND created_at < ?", date.at_beginning_of_day, date.end_of_day) }
  scope :without_new, lambda { |date = nil | where("created_at < ? ", date.at_beginning_of_day) }
  validates :artist, :name, :new_path, presence: true


  def artist_name
    artist.try(:name)
  end

  def artist_name=(name)
    self.artist = Mp3Artist.find_or_create_by_name(name) if name.present?
  end


  def album_name
    album.try(:name)
  end

  def album_name=(name)
    album = Mp3Album.new
    album.year = Time.now.year
    album.name = name
    album.artist = self.artist
    album.save
    self.album = album
    save
  end

  def save_file_length
  	TagLib::FileRef.open(self.new_path.path) do |file|
  		unless file.nil?
  			length_sec = file.audio_properties.length
  			length = Time.at(length_sec).utc.strftime("%M:%S")
  			self.length_sec = length_sec
  			self.length = length
  		end
  	end
  end

  def create_128kbs
    bitrate = "128"
    kbs128 = self.bitrates.new(file_bitrate: "128")
    input_path = self.new_path.path
    output_path = FileUtils.mkdir_p("#{Rails.root}/public/tmp/#{self.id}/kbs128").first
    system "lame --preset 128 #{input_path} #{output_path}/#{self.fname}_#{bitrate}.mp3"
    kbs128.file = File.open("#{output_path}/#{self.fname}_#{bitrate}.mp3")
    kbs128.file_size = File.size("#{output_path}/#{self.fname}_#{bitrate}.mp3")
    kbs128.save
    FileUtils.rm_r("#{Rails.root}/public/tmp/#{self.id}")
  end

  def create_64kbs
    bitrate = "64"
    kbs64 = self.bitrates.new(file_bitrate: bitrate)
    input_path = self.new_path.path
    output_path = FileUtils.mkdir_p("#{Rails.root}/public/tmp/#{self.id}/kbs64").first
    system "lame --preset mw-us #{input_path} #{output_path}/#{self.fname}_#{bitrate}.mp3"
    kbs64.file = File.open("#{output_path}/#{self.fname}_#{bitrate}.mp3")
    kbs64.file_size = File.size("#{output_path}/#{self.fname}_#{bitrate}.mp3")
    kbs64.save
    FileUtils.rm_r("#{Rails.root}/public/tmp/#{self.id}")
  end

  def create_id3v2_tags_from name
    TagLib::MPEG::File.open(self.new_path.path) do |file|
      tag = file.id3v2_tag
      if name.include?(' – ')
        tag.artist = name.split(' – ').first
        tag.title = name.split(' – ').last
      elsif name.include?(' - ')
        tag.artist = name.split(' - ').first
        tag.title = name.split(' - ').last
      else
        tag.artist = name
        tag.title = name
      end
      tag.album = ID3v2_ALBUM
      file.save
    end
  end

  protected
  
  def create_permalink
    self.permalink = self.fname
  end

end
