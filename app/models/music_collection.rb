# == Schema Information
#
# Table name: music_collections
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MusicCollection < ActiveRecord::Base

	attr_accessible :name

end
