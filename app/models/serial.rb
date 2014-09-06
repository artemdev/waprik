# == Schema Information
#
# Table name: serials
#
#  id           :integer          not null, primary key
#  description  :string(255)
#  season       :integer
#  updating     :boolean          default(TRUE)
#  name         :string(255)
#  cover        :string(255)
#  hit          :boolean
#  years        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_at :datetime
#

class Serial < ActiveRecord::Base
  attr_accessible :cover, :description, :season, :updating, :name, :hit, :years, :series_attributes, :category, :new_genres
  attr_accessor :category, :new_genres
  mount_uploader :cover, CoverUploader

  validates_presence_of :name, message: '^ Нужно указать название сериала' 
  validates_presence_of :cover, message: '^ Нужно добавить ковер' 
  validates_presence_of :description, message: '^ Нужно описать сериал' 
  validates_presence_of :season, message: '^ Нужно указать сезон' 
  validates_presence_of :years, message: '^ Нужно указать год(ы) выхода сериала' 

  has_many :series, dependent: :destroy
  has_many :genres_through, class_name: "GenreThrough", as: :genreable
  has_many :genres, through: :genres_through


  accepts_nested_attributes_for :series

  scope :hits, where(hit: true)
  scope :latest, order("updated_at DESC")

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
