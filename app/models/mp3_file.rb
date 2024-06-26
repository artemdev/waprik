# == Schema Information
#
# Table name: mp3_files
#
#  id                :integer          not null, primary key
#  ftp_path          :string(256)
#  path              :string(256)
#  name              :string(256)
#  fname             :string(256)
#  length            :string(5)        default("00:00")
#  genre_id          :integer
#  artist_id         :integer
#  album_id          :integer
#  order             :integer
#  order_nomination  :integer          default(0)
#  hit               :boolean          default(FALSE)
#  file_hit_date     :datetime
#  new               :boolean          default(FALSE)
#  download          :integer          default(0)
#  file_comment_up   :text
#  file_comment_down :text
#  created_at        :datetime
#  new_path          :string(255)
#  length_sec        :integer
#  news_id           :integer
#  permalink         :string(255)
#  updated_at        :datetime         not null
#  published_at      :datetime
#  vk_url            :string(255)
#

    
require 'taglib'
class Mp3File < ActiveRecord::Base
  default_scope order("mp3_files.created_at DESC")

  attr_accessible :name, :path, :new_path, :artist_name, :album_name, :new_file, :hit, :new_collection
  attr_accessor :new_file, :new_collection
 
  ID3v2_ALBUM = "waprik.ru - новая музыка"

  # before_save :set_name_fname_artist_album
  before_create :save_file_length
  before_create :create_permalink
  after_create :touch_collection

  mount_uploader :path, Mp3Uploader
  mount_uploader :new_path, MusicUploader
  
  has_many :collection_music_through, foreign_key: 'track_id'
  has_many :collections, through: :collection_music_through
  has_many :bitrates, class_name: 'Mp3Bitrate', foreign_key: 'file_id'
  has_many :downloads, as: :downloadable
  belongs_to :artist, class_name: 'Mp3Artist'
  belongs_to :album, class_name: 'Mp3Album'
  belongs_to :news, class_name: 'News', foreign_key: 'news_id'

  scope :latest, order("created_at DESC")
  scope :published_at, lambda { |date = nil | where(created_at: date.at_beginning_of_day..date.end_of_day) }
  scope :without_new, lambda { |date = nil | where("mp3_files.created_at <= ?", date.at_beginning_of_day) }
  scope :hits, -> { where("hit = ?", true) }
  scope :top, lambda { |number = 100| where("hit = ?", true).limit(number) }

  validates :artist, :name, presence: true


  include Tire::Model::Search
  include Tire::Model::Callbacks


  def set_name_fname_artist_album
    self.set_name_from self.new_path.path
    self.set_fname
    self.set_artist_name_from self.name.split(' - ').first
    self.set_album_name_from "waprik.ru - новинки музыки"
  end


  def set_artist_name_from name
    self.artist = Mp3Artist.find_or_create_by_name(name) if name.present?
  end


  def set_name_from file
    self.name = File.basename(file, ".mp3").gsub('–', '-').gsub('&amp;', 'and').gsub('&', 'and').gsub('\'', '')
  end

  def set_fname
    self.fname = Russian.translit(self.name.gsub(' ', '_').gsub('–', '-').delete('(').delete(':').delete(')').delete('/').delete('?').delete('.').delete('!'))
  end


  def set_album_name_from name
    album = Mp3Album.find_or_create_by_name(name)
    if album.new_record?
      album = Mp3Album.new
      album.year = Time.now.year
      album.name = name
      album.artist = self.artist
      album.save
    end
    self.album = album
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

  def set_collection id
    if collection = Collection.find(id)
      self.collections << collection
    end
  end

  def touch_collection
    if self.collections.any?
      self.collections.each do |collection|
        unless collection.with_music?
          collection.with_music = true 
          collection.save
        end
      end
    end
  end

  # скачивание
  def download! user_agent
    self.download += 1
    self.downloads.create!(user_agent: user_agent)
  end

  protected
  
  def create_permalink
    self.permalink = self.fname
  end

end
