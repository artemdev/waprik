require 'spec_helper'

describe "Admin" do
		let(:admin) { FactoryGirl.create(:admin_user) }

    it "Может добавлять новый сериал и файлы к нему" do
    	sign_in admin
    	visit admin_serials_path
    	click_link "new-serial"
    	fill_in "title", with: "Последний из Магикян"
    	select(1, from: "season")
    	fill_in "years", with: "2015-2020"
    	attach_file("torrent", with: "/public/testing/films/for_testing.mp4")
    	fill_in "description", with: "описание"
    	attach_file("cover", with: "/public/testing/films/cover.mp4")
    	fill_in "new_genres", with: "приключения"
    	click_button "next"
    end
end
