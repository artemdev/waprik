# == Schema Information
#
# Table name: music
#
#  id         :integer          not null, primary key
#  hit        :boolean
#  downloads  :integer
#  name       :string(255)
#  link_orig  :string(255)
#  link_128   :string(255)
#  link_64    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Music < ActiveRecord::Base
  attr_accessible :hit, :downloads, :link_orig, :link_128, :link_64, :name
  self.table_name = "music"

  has_and_belongs_to_many :collections, join_table: "collections_music"
  has_and_belongs_to_many :categories, join_table: "categories_music" 

end
