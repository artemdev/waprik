require 'spec_helper'

describe "WebCollections" do
  describe "Админ / модератор" do
  	let(:admin) { FactoryGirl.create(:admin_user) }

    it "создает коллекцию" do
    	sign_in admin
    	visit admin_films_collections_path
    	click_link "новая подборка"
    	page.status_code.should be(200)
    end

    xit "добавляет фильмы в коллекцию" do
    end

    xit "редактирует коллекцию" do
    end

    xit "удаляет коллекцию" do
    end  
  end
end
