class Picture < ActiveRecord::Base
  attr_accessible :image, :erotic

  mount_uploader :image, PictureUploader

  scope :erotic, where(erotic: true)
  scope :latest, order("created_at DESC")

end
