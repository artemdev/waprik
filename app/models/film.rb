# == Schema Information
#
# Table name: films
#
#  id                    :integer          not null, primary key
#  item_id               :integer
#  title                 :string(100)
#  user_id               :integer
#  is_favourite          :boolean
#  about                 :text
#  duration_hours        :integer
#  duration_minutes      :integer
#  duration_seconds      :integer
#  time                  :integer
#  download              :integer          default(0)
#  world_estimate        :string(10)
#  cis_estimate          :string(10)
#  last_download_time    :integer
#  prepare_status        :string(100)
#  file_name             :string(255)
#  month                 :integer
#  year                  :integer
#  quality_id            :integer
#  translation_id        :integer
#  count_likes           :integer
#  count_comments        :integer
#  created_at            :datetime         not null
#  cover                 :string(255)
#  updated_at            :datetime
#  permalink             :string(255)
#  ru_title              :string(255)
#  en_title              :string(255)
#  visible               :boolean
#  blocked               :boolean
#  broken                :boolean
#  published_at          :datetime
#  brb_url               :string(255)
#  recomendation_list_id :integer
#  torrent               :string(255)
#  vk                    :boolean
#  youtube_link          :string(255)
#

require 'elasticsearch/rails/tasks/import'
class Film < ActiveRecord::Base
  default_scope { order("films.created_at DESC") }
  attr_accessible :ru_title, :en_title,  :youtube_link, :is_favourite, :cis_estimate, :world_estimate, :about, :new_actors, :new_directors, :selected_genres, :cover, :year, :duration_hours, :duration_minutes, :remove_cover, :trailer_filename, :ru_title, :en_title, :new_collection, :blocked, :new_cover, :common_films, :brb_url, :torrent, :visible

	attr_accessor :new_actors, :new_directors, :selected_genres, :trailer_filename, :new_collection, :new_cover, :common_films

  VK_FILMS_PUBLIC_ID = "-44657162"

  mount_uploader :cover, CoverUploader
  mount_uploader :torrent, TorrentUploader

  before_create :create_title
  before_create :create_permalink

  # actors
  has_many :films_actors_through, class_name: "FilmActorThrough"
  has_many :actors, through: :films_actors_through
  # genres
  has_many :films_genres_through, class_name: "GenreThrough", as: :genreable
  has_many :genres, through: :films_genres_through
  
  has_many :trailers, class_name: "FilmTrailer"
  has_many :downloads, as: :downloadable
  has_many :collection_film_throughs
  has_many :collections
  
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
  has_many :collections, through: :collection_film_through, foreign_key: 'collection_id'

  # visits
  has_many :visits_from, class_name: 'Visit', as: 'fromable' # инициатор визита
  has_many :visited, class_name: 'Visit', as: 'visitable' # обладатель визита

  # wishes
  has_many :wishes, as: 'wishable'

  # recomendations
  belongs_to :recomendation_list
  
  validates :cover, presence: true

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  scope :latest, order("created_at DESC")
  scope :favourite, where("is_favourite = ?", true)
  scope :visible, where("visible = ?", true)

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

  def set_collection id
    if id.present? && collection = Collection.find(id)
      self.collections << collection
    end
  end

  def track_visit_from source
    content = source.class.to_s.constantize.find(source.id)
    visit = self.visited.new
    visit.fromable = content
    visit.save
  end  

  def create_recomendations!
    playlist = ParseBrbFilm.new(self.brb_url).common_films
    recomendation_list = RecomendationList.create!
    recomendation_list.films << self
    playlist.each do |movie|
      source_movie = ParseBrbFilm.new(movie.last)
      if Film.find_by_ru_title(source_movie.ru_title.downcase)
        site_movie = Film.find_by_ru_title(source_movie.ru_title)
        site_movie.recomendation_list_id = recomendation_list.id
        site_movie.brb_url  = movie.last
        site_movie.save
      else
        site_movie = Film.new
        site_movie.ru_title = source_movie.ru_title
        site_movie.en_title = source_movie.eng_title
        site_movie.about = source_movie.description
        site_movie.remote_cover_url = source_movie.cover
        site_movie.brb_url  = movie.last
        site_movie.year  = source_movie.years
        site_movie.add_directors(source_movie.directors.first.to_s)
        site_movie.add_genres(source_movie.genres.first.to_s)
        site_movie.add_actors(source_movie.actors.first.to_s)
        site_movie.recomendation_list_id = recomendation_list.id
        site_movie.visible = false
        # site_movie.create_common_films!
        site_movie.save
      end
    end
  end

  def make_visible!
    self.visible = true
    save
  end

  def post_to_vk_from user
    vk = VkontakteApi::Client.new(user.vk_access_token)
    # загрузить cover в vk
    # 1 ...
    # 2 ...
    # 3 ...
    # отправить в vk
    vk.wall.post(owner_id: VK_FILMS_PUBLIC_ID, message: self.title, from_group: 1, attachments: Rails.application.routes.url_helpers.film_url(self, host: 'waprik.org'))
    self.vk = true
    save
  end

  # скачивание
  def download! user_agent
    self.download += 1
    self.downloads.create!(user_agent: user_agent)
  end

  private

  def create_permalink
    self.permalink = self.ru_title.parameterize
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


end
