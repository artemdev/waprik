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
class Film < ActiveRecord::Base
  attr_accessible :title, :is_favourite, :cis_estimate, :world_estimate, :about, :new_actors, :new_directors, :selected_genres, :cover, :year, :duration_hours, :duration_minutes, :remove_cover,  :trailer_attributes, :ru_title, :en_title
	attr_accessor :new_actors, :new_directors, :selected_genres, :trailer

  mount_uploader :cover, CoverUploader

  # actors
  has_many :films_actors_through, class_name: "FilmActorThrough"
  has_many :actors, through: :films_actors_through
  # genres
  has_many :films_genres_through, class_name: "FilmGenreThrough"
  has_many :genres, through: :films_genres_through
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
  # trailers
  has_one :trailer, class_name: "FilmTrailer", dependent: :destroy
  accepts_nested_attributes_for :trailer

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

end
