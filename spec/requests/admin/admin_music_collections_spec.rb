require 'spec_helper'

describe "Admin::MusicCollections" do
  describe "Админ" do
    it "Добавляет фильмы в коллекцию" do
      get new_admin_music_collection_path
      fill_in :film_name, with: "первый фантастический"
      click_button "продолжить"
      page.should have_content "первый фантастический"
    end
  end
end
