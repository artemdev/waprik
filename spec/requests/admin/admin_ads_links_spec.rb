require 'spec_helper'
 
  describe "админ может" do
		subject { page }

  	let(:link) { FactoryGirl.create(:ads_link) }
  	let(:admin_user) { FactoryGirl.create(:admin_user) }
  	before(:each) { sign_in admin_user }

    it "отображает все активные ссылки" do

    	visit admin_links_path
    	expect have_content "Скачать бесплатно android игры"
    end

		it "создать новые ссылки" do
			visit new_admin_link_path
			fill_in "Название", with: 'бесплатные загрузяки'
			fill_in "Откуда", with: 'google.com'
			fill_in "Куда", with: 'waprik.ru'
			select '204/07/31', :from => 'Истекает'
			click_button 'Создать'
			expect have_content "Ссылка успешно добавлена"
		end
  end
