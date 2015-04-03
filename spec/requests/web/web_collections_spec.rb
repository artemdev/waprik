require 'spec_helper'

describe "Web::Collections" do
  describe "Я посетитель ..." do
  	let(:collection) { FactoryGirl.create(:collection) }

    it "На главной я вижу новые коллекции, поиск." do
      visit web_collections_path
     	page.should have_content(collection.name)
     	page.should have_button("найти!")
    end
  end
end
