# == Schema Information
#
# Table name: films_parts
#
#  id         :integer          not null, primary key
#  num        :integer
#  file_id    :integer
#  film_id    :integer
#  format_id  :integer
#  real_name  :string(255)
#  duration   :integer
#  size       :integer
#  downloads  :integer
#  created_at :datetime
#  updated_at :datetime
#

# integer "num"
# integer "file_id"
# integer "film_id"
# integer "format_id"
# string  "real_name"
# integer "duration"
# integer "size"
# integer "downloads"
class FilmPart < ActiveRecord::Base
  self.table_name = "films_parts"

	mount_uploader :real_name, FilmPartUploader

  belongs_to :film_file, foreign_key: 'file_id'
	belongs_to :film
	
end
