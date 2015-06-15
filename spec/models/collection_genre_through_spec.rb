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

require 'spec_helper'

describe CollectionGenreThrough do
  pending "add some examples to (or delete) #{__FILE__}"
end
