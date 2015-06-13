require 'spec_helper'

describe "Music" do
	subject { page }
	describe "Посетитель" do
		let(:track) { FactoryGirl.create(:mp3_track, name: 'lana del rey') }

    it "Скачивает музыку" do
    	track.permalink = "lana_del_rey"
    	track.save
    	track.bitrates.last.file.should_not be_nil
      visit track_path(track.permalink)
      click_link "download-mp3"
      page.response_headers['Content-Disposion'].should == "attachment; filename=\"lana_del_rey.mp3\""
    end
    it "Видит подборки на главной музыки" do
    end
  end
end
