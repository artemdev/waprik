class Mp3Alphabet < ActiveRecord::Base
	self.table_name = "mp3_alphabet"
  # attr_accessible :title, :body

  # scope :eng, joins(:artists).where(mp3_artists: {lang: "eng"}).where("first_letter = ?", params[:first_letter])
  # scope :rus, includes('artists').where(lang: "eng").refernces
  scope :sorted, order("id")
  scope :eng, order("id").limit(28)
  
  has_many :artists, class_name: 'Mp3Artist', foreign_key: 'first_letter'

end
