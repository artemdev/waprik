require 'spec_helper'

describe "CollectionGenres" do
  describe "Админ" do
    let(:admin_user) { FactoryGirl.create(:admin_user) }

    it "создает жанр для подборок" do
      film_title = "10 крутых фильмов про отношения"
      sign_in admin_user
      visit "/admin/collection_genres/new"
      fill_in :title, with: film_title
      click_button "new-collection"
      expect(page).to have_content(film_title)
    end

    xit "добавляет коллекцию в жанр" do
    end

  end

  describe "пользователь" do
  	xit "видит жанры коллекций на главной фильмов" do
  	end
  end
end
