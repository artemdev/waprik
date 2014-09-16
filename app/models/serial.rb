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
#  permalink    :string(255)
#  lang         :boolean # 0 - rus , 1 - eng
#

class Serial < ActiveRecord::Base
  attr_accessible :cover, :description, :season, :updating, :name, :hit, :years, :series_attributes, :category, :new_genres, :seasons_attributes, :lang
  attr_accessor :category, :new_genres

  def to_param
    "#{id} #{name}".parameterize
  end

  before_update :set_permalink

  mount_uploader :cover, CoverUploader

  validates :name, presence: { message: '^ Нужно указать название сериала' }
  validates :cover, presence: { message: '^ Нужно добавить ковер' }
  validates :description, presence: { message: '^ Нужно описать сериал' }
  validates :years, presence: { message: '^ Нужно указать год(ы) выхода сериала' }

  has_many :series, dependent: :destroy
  accepts_nested_attributes_for :series
  has_many :genres_through, class_name: "GenreThrough", as: :genreable
  has_many :genres, through: :genres_through
  
  has_many :related_items
  has_many :relations, through: :related_items, foreign_key: 'source_item_id'
  has_many :related, through: :related_items, foreign_key: 'second_item_id'


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

  private

  def set_permalink
    self.permalink = self.name.parameterize
    true
  end

end
