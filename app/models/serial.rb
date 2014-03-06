class Serial < ActiveRecord::Base
  attr_accessible :cover, :description, :season, :updating, :name, :hit, :years, :series_attributes, :category
  attr_accessor :category
  mount_uploader :cover, CoverUploader

  validates_presence_of :name, message: '^ Нужно указать название сериала' 
  validates_presence_of :cover, message: '^ Нужно добавить ковер' 
  validates_presence_of :description, message: '^ Нужно описать сериал' 
  validates_presence_of :season, message: '^ Нужно указать сезон' 
  validates_presence_of :years, message: '^ Нужно указать год(ы) выхода сериала' 
 

  has_and_belongs_to_many :categories
  has_many :series, dependent: :destroy

  accepts_nested_attributes_for :series

  scope :hits, where(hit: true)
  scope :latest, order("updated_at DESC")

end
