# == Schema Information
#
# Table name: films_collections
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  youtube_link :string(255)
#  cover        :string(255)
#  description  :string(255)
#

require 'spec_helper'

describe FilmsCollection do
	describe "коллекция фильмов"
		it "может иметь несколько фильмов" do
			
		end
	end
end
