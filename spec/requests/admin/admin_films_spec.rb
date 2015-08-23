require 'spec_helper'

describe "Admin" do
	let (:admin) { FactoryGirl.create(:admin_user)}
	let (:collection) { FactoryGirl.create(:collection)}

	it "добавляет фильм в подборку" do
		# sing_in admin
		# visit edit_admin_collection_path(collection)
		# fill_in :film_name, with: '1+1 / Неприкасаемые'
		# fill_in :youtube_link, with: 'https://www.youtube.com/watch?v=2FoP5ZXjVhQ'
		# attach_file(:cover, 'public/testing/films/1+1.jpg')
		# click_link "продолжить"
		# page.should have_title '1+1 / Неприкасаемые'
	end
end
