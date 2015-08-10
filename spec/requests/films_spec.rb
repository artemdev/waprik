require 'spec_helper'

describe "Films" do
  describe "посетитель" do
  	let(:film) { FactoryGirl.create(:blocked_film) }
  	let(:film_format) { FactoryGirl.create(:film_format) }
  	let(:film_file) { FactoryGirl.create(:film_file, film_id: film.id) }

    it "не может скачивать заблокированный фильм" do
    	visit film_path(film)
    	page.should have_content("Скачивание фильма заблокировано правообладателем")
    end

    it "видит обновление качества фильмов" do
     	film_file.film.should_not be_nil   	
    	visit updating_films_path
    	page.should have_content(film.title)
    end

    it "видит жанры подборок фильмов на главной" do
      # 
    end

  end
end
