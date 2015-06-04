# == Schema Information
#
# Table name: films_translations
#
#  id         :integer          not null, primary key
#  title      :string(50)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

# string  "title",    :limit => 50
# integer "position"
class FilmTranslation < ActiveRecord::Base
  self.table_name = "films_translations"

  attr_accessible :title

  has_many :films
end
