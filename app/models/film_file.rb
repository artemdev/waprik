# == Schema Information
#
# Table name: films_files
#
#  id         :integer          not null, primary key
#  film_id    :integer
#  format_id  :integer
#  title      :string(50)
#  real_name  :string(255)
#  size       :integer
#  ext        :string(10)
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#  quality_id :integer
#

class FilmFile < ActiveRecord::Base
  self.table_name = "films_files"
	attr_accessible :new_file, :format_title, :film_id

	mount_uploader :real_name, FilmFileUploader

	belongs_to :film
	belongs_to :format, class_name: "FilmFormat"
	belongs_to :quality, class_name: 'FilmQuality', foreign_key: 'quality_id'
  has_many :film_parts, foreign_key: 'file_id', dependent: :destroy

	# validates :real_name, presence: true



end
