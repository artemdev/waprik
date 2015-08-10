# == Schema Information
#
# Table name: collections
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  hit                 :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  with_videos         :boolean          default(FALSE)
#  with_music          :boolean          default(FALSE)
#  description         :string(255)
#  image               :string(255)
#  permalink           :string(255)
#  vk_title            :string(255)
#  full_sound          :string(255)
#  source_url          :string(255)
#  collection_genre_id :integer
#

class FilmsCollection < Collection

	has_many :collection_film_through, foreign_key: "collection_id"
  has_many :films, through: :collection_film_through

end
