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
#  vk_title    :string(255)
#  full_sound  :string(255)
#  source_url  :string(255)
#

include ApplicationHelper
class Collection < ActiveRecord::Base
  attr_accessible :name, :hit, :image, :description, :posts_attributes, :tracks_attributes, :source_url, :with_music

  mount_uploader :image, CoverUploader
  mount_uploader :full_sound, MusicUploader

  before_create :create_permalink
  before_update :create_permalink, if: :name_changed?

  has_many :collection_video_through
  has_many :videos, through: :collection_video_through

  has_many :collection_music_through
  has_many :tracks, through: :collection_music_through
  accepts_nested_attributes_for :tracks

  has_many :collection_film_through
  has_many :films, through: :collection_film_through

  has_many :subscribers, class_name: 'Subscribtion', as: :subscribable

  scope :hits, where("hit = ?", true)
  scope :today, lambda { where(updated_at: Time.now.at_beginning_of_day..Time.now.end_of_day) }
  scope :latest, order("created_at DESC")
  scope :fresh, order("updated_at DESC")
  scope :with_music, lambda { where(with_music: true) }
  scope :with_films, lambda { where(with_films: true) }
  scope :with_videos, where(with_videos: true)

  validates :name, presence: true

  # before_create :join_tracks
  # before_update :join_tracks

  def author 
    nil
  end
  
  # Есть ли видео в коллекции ?
  def with_videos
    return true if self.videos.any?
  end

  # Есть ли фильмы в коллекции ?
  def with_films
    return true if self.films.any?
  end

  def join_tracks
    track_paths = []
    output_path = Rails.root + "public" + self.full_sound.store_dir + (self.name.parameterize + ".mp3")
    self.tracks.each do |track|
      track_paths << track.new_path
    end
    if track_paths.any? && !self.full_sound.path.present?
      system "sox -m " + track_paths.join(" ")  + output_path.to_s
      self.full_sound = File.open(output_path)
      save
    end
    self.full_sound.path
  end

  def with_music
    self.with_music = true
    save!
  end

  protected

  def create_permalink
    self.permalink = name.parameterize
  end

end
