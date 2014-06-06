# string  "title",    :limit => 50
# integer "position"
class FilmTranslation < ActiveRecord::Base
  self.table_name = "films_translations"

  attr_accessible :title

  has_many :films
end
