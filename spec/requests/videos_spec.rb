require 'spec_helper'

describe "Videos" do
  describe "GET /videos" do
    it "Page should have_content 'Видео'" do
    	visit '/videos/index'
    	page.should have_content ('waprik.ru')
    end
  end
end
