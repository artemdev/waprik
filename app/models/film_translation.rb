class FilmTranslation < ActiveRecord::Base
  self.table_name = "films_translations"

  attr_accessible :title
end
