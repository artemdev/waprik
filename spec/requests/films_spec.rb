require 'spec_helper'

describe "Films" do
  describe "посетитель" do
  	let(:film) { FactoryGirl.create(:blocked_film) }
    it "не может скачивать заблокированный фильм" do
    	visit film_path(film)
    	page.should have_content("Фильм заблокирован правообладателем")
    end
  end
end
