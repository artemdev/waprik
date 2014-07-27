require 'spec_helper'

describe "Music" do
	subject { page }
	describe "index page" do
		let(:track) { FactoryGirl.create(:mp3_track, title: 'eminem') }

    it "показывает раздел новинок" do
      visit tracks_path
      page.should have_content("Новинки")
    end
  end
end
