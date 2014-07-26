require 'spec_helper'

describe "Music" do
	subject { page }
	describe "index page" do
		let(:track) { FactoryGirl.create(:mp3_track, title: 'eminem') }

    it "показывает существующие треки" do
      visit tracks_path
      page.should have_content "eminem"
    end
  end
end
