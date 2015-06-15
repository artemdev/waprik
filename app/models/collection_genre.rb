# == Schema Information
#
# Table name: collection_genres
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CollectionGenre < ActiveRecord::Base
  # attr_accessible :title, :body
end
