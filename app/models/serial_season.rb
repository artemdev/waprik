# == Schema Information
#
# Table name: serial_seasons
#
#  id              :integer          not null, primary key
#  serial_id       :integer
#  number          :integer
#  serial_serie_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string(255)
#

class SerialSeason < ActiveRecord::Base
	attr_accessible :number

	belongs_to :serial
	belongs_to :serie, class_name: "Series"

end
