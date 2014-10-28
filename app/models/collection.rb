# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  hit         :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  with_videos :boolean          default(FALSE)
#  with_music  :boolean          default(FALSE)
#  description :string(255)
#  image       :string(255)
#  permalink   :string(255)
#

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

  scope :hits, where("hit = ?", true)
  scope :latest, order("created_at ASC")
  scope :fresh, order("updated_at ASC")
  scope :with_music, lambda { where(with_music: true) }
  scope :with_films, where(with_films: true)
  scope :with_videos, where(with_videos: true)

  validates :name, presence: true

  # Есть ли музыка в коллекции ?
  def with_music
    return true if self.tracks.any?
  end

  # Есть ли видео в коллекции ?
  def with_videos
    return true if self.videos.any?
  end

  # Есть ли фильмы в коллекции ?
  def with_films
    return true if self.films.any?
  end

  protected

  def create_permalink
    self.permalink = permalink_for name
  end

end
