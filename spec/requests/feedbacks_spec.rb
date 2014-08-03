require 'spec_helper'

describe "Feedbacks" do
  describe "user" do
    it "может отправить feedback" do
      visit feedbacks_path
      click_link "Написать отзыв"
      fill_in "Как вас зовут ?", with: 'Артем'
      choose 'feedback_new_category_thank'
      fill_in "Сообщение", with: 'Все круто! Спасибо за сайт!'
      expect { click_button "Отправить" }.to change{ Feedback.all.count }.by(1)
      expect(page).to have_content("Спасибо! Отзыв отправлен и появится в разделе как только на него ответит администратор")
    end
  end
  describe "admin user" do
  	let(:feedback) { FactoryGirl.create(:feedback) }
  	before(:each) { visit admin_feedbacks_path }

  	it "может удалять фидбеки" do
  	end

    it "отвечая на фидбек делает его публичным" do
    end
  end

end
