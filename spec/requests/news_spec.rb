require 'spec_helper'

describe "News" do

  describe "index" do
    it "should have the content 'Имя пользователя'" do
	    visit '/news/index'
			page.should have_content('Имя пользователя')
    end
  end

end
