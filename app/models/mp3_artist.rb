# == Schema Information
#
# Table name: mp3_artists
#
#  id                  :integer          not null, primary key
#  name                :string(256)
#  first_letter        :string(1)
#  lang                :string(3)
#  count_albums        :integer          default(0)
#  count_tracks        :integer          default(0)
#  count_hits          :integer          default(0)
#  artist_comment_up   :text
#  artist_comment_down :text
#  created_at          :datetime
#  updated_at          :datetime
#  permalink           :string(255)
#

class Mp3Artist < ActiveRecord::Base
  attr_accessible :name, :lang

  before_create :set_first_letter
  before_create :set_language
  before_update :check_language
  
  has_many :tracks, class_name: 'Mp3File', foreign_key: 'artist_id'
  has_many :albums, class_name: 'Mp3Album', foreign_key: 'artist_id'

  scope :eng, where(lang: "eng")
  scope :rus, where(lang: "rus")
  scope :sorted, order("first_letter")
  scope :latest, order("created_at DESC")

  def check_language
    case lang
      when "eng"
        self.lang = lang
      when "rus"
        self.lang = lang
    end
  end

  def eng?
    true if self.lang == "eng"
  end

  def rus?
    true if self.lang == "rus"
  end

  def set_language
    wl = WhatLanguage.new(:english, :russian)
    self.lang = "rus" if wl.language(self.name) == :russian
    self.lang = "eng" if wl.language(self.name) == :english
    true
  end

  private

  def set_first_letter
  	self.first_letter = name.first
  end 
end
