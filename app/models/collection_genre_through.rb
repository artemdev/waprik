# == Schema Information
#
# Table name: collection_genre_throughs
#
#  id            :integer          not null, primary key
#  collection_id :string(255)
#  genre_id      :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionGenreThrough < ActiveRecord::Base
  attr_accessible :collection_id, :genre_id
end
