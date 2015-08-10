# == Schema Information
#
# Table name: collection_genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#

class CollectionGenre < ActiveRecord::Base

  attr_accessible :title

  validates :title, presence: true

  has_many :collections

end
