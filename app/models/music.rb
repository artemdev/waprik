class Music < ActiveRecord::Base
  attr_accessible :hit, :downloads, :link_orig, :link_128, :link_64, :name
  set_table_name ("music")

  has_and_belongs_to_many :collections, :join_table => "collections_music"
  has_and_belongs_to_many :categories, :join_table => "categories_music" 

end
