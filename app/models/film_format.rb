# string "title",       :limit => 100,  :null => false
# string "description", :limit => 100,  :null => false
# string "ffparams",    :limit => 1000, :null => false
# string "ext",         :limit => 10,   :null => false
class FilmFormat < ActiveRecord::Base
  self.table_name = "films_formats"

  attr_accessible :title, :description, :ext
  has_many :film_files

  validates :title, presence: true

end
