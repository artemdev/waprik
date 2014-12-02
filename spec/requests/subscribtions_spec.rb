require 'spec_helper'

describe "Subscribtions" do
  describe "Admin" do
  	subject { page }

  	let(:admin) { FactoryGirl.create(:admin_user) }
  	let(:collection) { FactoryGirl.create(:collection) }

    it "оформляет подписку на странице коллекции" do
    	sign_in admin
    	visit admin_collection_path(collection.permalink)
    	click_on "подписаться"
    	page.should have_content "подписка оформлена"
    end
  end
end
