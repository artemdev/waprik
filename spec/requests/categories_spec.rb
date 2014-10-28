require 'spec_helper'

describe "Категории" do
	let (:category) { FactoryGirl.create(:category) }
	let (:video) { FactoryGirl.create(:video, category_id: category.id) }

  describe "Категория" do
    it "содержит видео" do
      visit category_path(category)
      page.should have_content(video.name)
    end   
  end
end
