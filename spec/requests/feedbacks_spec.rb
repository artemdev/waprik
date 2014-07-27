require 'spec_helper'

describe "Feedbacks" do
  describe "user" do
    it "может отправить feedback" do
      visit feedbacks_path
      click_link "Добавить отзыв"
      fill_in "Как вас зовут ?", with: 'Артем'
      choose 'feedback_category_thank'
      fill_in "Ваш отзыв или предложение", with: 'Все круто! Спасибо за сайт!'
      click_button "Отправить"
      expect(page).to have_content("Спасибо! Отзыв отправлен и появится в разделе как только на него ответит администратор")
    end
  end
  # describe "admin user" do
  # 	let(:feedback) { FactoryGirl.create(:feedback) }
  # 	before(:each) { visit admin_feedbacks_path }
  # 	it "может отвечать на фидбеки" do
  		
  # 	end

  # 	it "может удалять фидбеки" do
  		
  # 	end
  # end

end
