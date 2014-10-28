# == Schema Information
#
# Table name: pictures
#
#  id          :integer          not null, primary key
#  image       :string(255)
#  downloads   :integer          default(0)
#  description :string(255)
#  author_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  erotic      :boolean
#

class Picture < ActiveRecord::Base
  attr_accessible :image, :erotic

  mount_uploader :image, PictureUploader

  scope :erotic, where(erotic: true)
  scope :latest, order("created_at DESC")

end
