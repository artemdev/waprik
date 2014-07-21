include ApplicationHelper
class Collection < ActiveRecord::Base
  attr_accessible :name, :hit, :image, :description

  mount_uploader :image, CoverUploader

  before_create :create_permalink
  before_update :create_permalink, if: :name_changed?

  has_many :collection_video_through
  has_many :videos, through: :collection_video_through

  has_many :collection_music_through
  has_many :tracks, through: :collection_music_through

  has_many :collection_film_through
  has_many :films, through: :collection_film_through

  scope :hits, where("hit = ?", 1)
  scope :latest, order("created_at ASC")
  scope :with_music, lambda { where(with_music: true) }
  scope :with_films, where(with_films: true)
  scope :with_videos, where(with_videos: true)

  validates :name, presence: true

  # Есть ли музыка в коллекции ?
  def self.with_music
    return true unless Collection.tracks.empty?
  end

  # Есть ли видео в коллекции ?
  def with_videos
    return true unless self.videos == []
  end

  # Есть ли фильмы в коллекции ?
  def with_films
    return true unless self.films == []
  end

  protected

  def create_permalink
    self.permalink = permalink_for name
  end

end
