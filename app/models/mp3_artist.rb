class Mp3Artist < ActiveRecord::Base
  attr_accessible :name, :lang

  before_create :set_first_letter
  before_update :check_language
  
  has_many :tracks, class_name: 'Mp3File', foreign_key: 'artist_id'
  has_many :albums, class_name: 'Mp3Album', foreign_key: 'artist_id'

  scope :eng, where(lang: "eng")
  scope :rus, where(lang: "rus")
  scope :sorted, order("first_letter")
  scope :latest, order("created_at DESC")

  def check_language
    case lang
      when "eng"
        self.lang = lang
      when "rus"
        self.lang = lang
    end
  end

  private

  def set_first_letter
  	self.first_letter = name.first
  end 
end
