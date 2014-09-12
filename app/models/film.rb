# == Schema Information
#
# Table name: films
#
#  id                 :integer          not null, primary key
#  item_id            :integer
#  title              :string(100)
#  user_id            :integer
#  is_favourite       :boolean
#  about              :text
#  duration_hours     :integer
#  duration_minutes   :integer
#  duration_seconds   :integer
#  time               :integer
#  downloads          :integer          default(0)
#  world_estimate     :string(10)
#  cis_estimate       :string(10)
#  last_download_time :integer
#  prepare_status     :string(100)
#  file_name          :string(255)
#  month              :integer
#  year               :integer
#  quality_id         :integer
#  translation_id     :integer
#  count_likes        :integer
#  count_comments     :integer
#  created_at         :datetime         not null
#  cover              :string(255)
#  updated_at         :datetime
#  permalink          :string(255)
#  ru_title           :string(255)
#  en_title           :string(255)
#  without_files      :boolean
#  blocked            :boolean
#  broken             :boolean
#  published_at       :datetime
#

# integer "item_id"
# string  "title",              :limit => 100
# integer "user_id"
# boolean "is_favourite"
# text    "about"
# integer "duration_hours",     :limit => 1
# integer "duration_minutes",   :limit => 1
# integer "duration_seconds",   :limit => 1
# integer "time"
# integer "downloads",                         :default => 0
# string  "world_estimate",     :limit => 10
# string  "cis_estimate",       :limit => 10
# integer "last_download_time"
# string  "prepare_status",     :limit => 100
# string  "file_name"
# integer "month",              :limit => 1
# integer "year",               :limit => 2
# integer "quality_id"
# integer "translation_id"
# integer "news_time"
# integer "count_comments",                    :default => 0
# integer "count_likes",                       :default => 0
require 'elasticsearch/rails/tasks/import'
class Film < ActiveRecord::Base
  attr_accessible :is_favourite, :cis_estimate, :world_estimate, :about, :new_actors, :new_directors, :selected_genres, :cover, :year, :duration_hours, :duration_minutes, :remove_cover, :trailer_filename, :ru_title, :en_title, :new_collection, :blocked
	attr_accessor :new_actors, :new_directors, :selected_genres, :trailer_filename, :new_collection


  mount_uploader :cover, CoverUploader

  before_create :create_title

  # actors
  has_many :films_actors_through, class_name: "FilmActorThrough"
  has_many :actors, through: :films_actors_through
  # genres
  has_many :films_genres_through, class_name: "GenreThrough", as: :genreable
  has_many :genres, through: :films_genres_through
  
  has_many :trailers, class_name: "FilmTrailer"

  # directors
  has_many :films_directors_through, class_name: "FilmDirectorThrough"
  has_many :directors, through: :films_directors_through
  # files
  has_many :files, class_name: "FilmFile", dependent: :destroy
  has_many :file_parts, class_name: "FilmPart", dependent: :destroy
  # translation
  belongs_to :translation, class_name: "FilmTranslation"
  # quality
  belongs_to :quality, class_name: "FilmQuality"
  # trailersss_name: "FilmTrailer", dependent: :destroy

  has_many :collection_film_through, foreign_key: 'film_id'
  has_many :collections, through: :collection_film_through

  # validates :title, :about, :year, presence: true

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  scope :latest, order("created_at DESC")
  scope :favourite, where("is_favourite = ?", true)

  def add_actors(actors)
    separated_actors = actors.split("\n")
    separated_actors.each do |actor|
      actor.strip!
      if new_actor = FilmActor.find_by_name(actor)
        self.actors << new_actor
      else
        new_actor = FilmActor.create!(name: actor)
        self.actors << new_actor
      end 
  	end
  end

  def add_directors(directors)
    separated_directors = directors.split("\n")
    separated_directors.each do |director|
      director.strip!
      if new_director = FilmDirector.find_by_name(director)
        self.directors << new_director
      else
        new_director = FilmDirector.create!(name: director)
        self.directors << new_director
      end 
    end
  end

  def destroy_director(director)
    directors.delete(director)
  end

  def add_genres(genres)
    genres = genres.split("\n") if genres.instance_of?(String)
    genres.map do |genre|
      genre.strip!
      unless genre.empty?
        if found_genre = FilmGenre.find_by_title(genre)
          self.genres << found_genre unless self.genres.find_by_id(found_genre.id)
        else
          created_genre = FilmGenre.create!(title: genre)
          self.genres << created_genre
        end
      end
    end
  end
  
  def create_title
    if ru_title.present? && en_title.present?
      self.title = ru_title + " / " + en_title
    elsif ru_title.present? && !en_title.present?
      self.title = self.ru_title
    elsif en_title.present? && !ru_title.present?
      self.title = self.en_title
    end
  end


  def set_collection id
    if id.present? && collection = Collection.find(id)
      self.collections << collection
    end
  end

end
