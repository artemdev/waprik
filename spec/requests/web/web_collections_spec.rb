require 'spec_helper'

describe "Web::Collections" do
  describe "Посетитель" do
  	let(:collection) { FactoryGirl.create(:collection) }

    it "Видит новые коллекции, поиск." do
      visit web_collections_path
     	page.should have_content(collection.name)
     	page.should have_button("найти!")
    end


    it "может посещать страницу коллекции" do
      visit web_collections_path
     	page.should have_content(collection.name)
     	page.should have_button("найти!")
    end
  end
end
