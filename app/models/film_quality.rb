# == Schema Information
#
# Table name: films_qualities
#
#  id         :integer          not null, primary key
#  title      :string(50)
#  position   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

# string  "title",    :limit => 50
# integer "position"
class FilmQuality < ActiveRecord::Base
  self.table_name = "films_qualities"

  attr_accessible :title, :position

  has_many :films, foreign_key: 'quality_id'
  has_many :film_files
  
end
