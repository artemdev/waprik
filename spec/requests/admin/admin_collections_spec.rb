require 'spec_helper'

describe "Collections ..." do
  describe "Admin ..." do
  	let(:admin) { FactoryGirl.create(:admin_user) }
    let(:collection) { FactoryGirl.create(:collection) }
    let(:film) { FactoryGirl.create(:film) }

    # it "может добавлять новые треки в подборки" do
    # 	sign_in admin
    # 	visit edit_admin_collection_path(collection)
    # 	page.should have_content(collection.name)
    # 	page.attach_file("new_path", '/testing/music/lana_del_rey.mp3')
    # 	click_button "продолжить"
		  # response.should be_success
    # end
    # it "может редактировать подборки" do
    # end

    # it "может удалять подборки" do
    # end

    it "может добавлять фильм в подборки" do
      visit edit_admin_collection_path(collection)
      fill_in :film_name, with: 'тест'
      click_link "найти"
    end
  end
end
