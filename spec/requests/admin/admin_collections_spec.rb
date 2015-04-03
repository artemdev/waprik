require 'spec_helper'

describe "Collections ..." do
  describe "Admin ..." do
  	let(:admin) { FactoryGirl.create(:admin_user) }
  	let(:collection) { FactoryGirl.create(:collection) }

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
  end
end
