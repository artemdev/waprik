require 'spec_helper'

describe "Videos" do
	subject { page }
	fa
  describe "главная страница" do
    it "должна содержать 'Жанры'" do
    	visit videos_path
    	page.should have_content 'Жанры'

    end
    it "должна содержать 'Классные подборки'" do
    	visit videos_path
    	page.should have_content 'Классные подборки'
    end
    # it "должна содержать 'Классные подборки'" do
    # 	visit videos_path
    # 	page.should have_content ('новинки')
    # 	page.should have_link "На главную"
    # end
  end
end
