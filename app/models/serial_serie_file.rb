# == Schema Information
#
# Table name: serial_serie_files
#
#  id         :integer          not null, primary key
#  serie_id   :integer
#  quality_id :integer
#  format_id  :integer
#  attach     :string(255)
#  size       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  download   :integer          default(0)
#

class SerialSerieFile < ActiveRecord::Base
  attr_accessible :attach, :format_id, :quality_id

  VK_SERIALS_PUBLIC_ID = "27786322"

  mount_uploader :attach, SerialsUploader

  belongs_to :serie, class_name: "Series"
  belongs_to :quality, class_name: "FilmQuality"
  belongs_to :format, class_name: "FilmFormat"
  validates :quality, :serie, :format, presence: true



end
