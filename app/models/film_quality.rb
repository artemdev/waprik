# == Schema Information
#
# Table name: films_qualities
#
#  id         :integer          not null, primary key
#  title      :string(50)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

# string  "title",    :limit => 50
# integer "position"
class FilmQuality < ActiveRecord::Base
  self.table_name = "films_qualities"

  before_create :set_nulls

  attr_accessible :title, :position

  has_many :films, foreign_key: 'quality_id'
  has_many :film_files

private

  def set_nulls
 		self.position = 0
  end
  
end
