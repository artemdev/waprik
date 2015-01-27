require_relative '../../spec_helper'

describe "Web::Collections" do
  describe "GET /web_collections" do
  	let(:collection) { FactoryGirl.create(:collection) }

    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit web_collection_path(collection)
     	page.status_code.should be(200)
    end
  end
end
