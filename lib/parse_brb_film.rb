require 'mechanize'
require 'open-uri'

class ParseBrbFilm
	# TODO преобразовать массивы в хеши

	SOURCE_URL = 'http://brb.to'

	def initialize http=""
		agent = Mechanize.new		
		# найти фильм по keywords
		@movie = agent.get SOURCE_URL + http
	end

	def ru_title
		title = ""
		@movie.search('.b-tab-item__title').each do |div|
			title = div.at('span').text.strip
		end
		title
	end

	def eng_title
		@movie.at('.b-tab-item__title-origin').text if @movie.at('.b-tab-item__title-origin')
	end

	def genres
		film_genres = []
		@movie.search('.item-info').each do |i|
			i.search('span').each do |span|
				 if span['itemprop'] == "genre"
					 	span.search('a').each do |a|
					 		film_genres << a.at('span').text
					 	end
				 end
			end
		end
		film_genres
	end

	def years
		film_years = ""
		@movie.search('.item-info').each do |div|
			div.search('tr').each_with_index do |tr, i|
				if i == 1
					film_years = tr.at('span').text
				end
			end
		end
		film_years
	end

	def cover
		cover_image = ""
		@movie.search('.poster-main').each do |div|
			cover_image = div.at('img')['src']
		end
		cover_image
	end

	def description
		@movie.at('p.item-decription').text
	end

	def common_films
		films = []
		@movie.search('.b-poster-new').each do |poster|
			films << [poster.at('.m-poster-new__short_title').text, poster.at('.b-poster-new__image-poster')['style'].split("background-image: url(").last.tr('));\'',''), "#{poster.at('a')['href']}"]
		end
		# cover, title, link
		films
	end

	def actors
		cast = []
		@movie.search('.item-info').each do |div|
			div.search('span').each do |span|
				if span['itemprop'] == "actor"
					span.search('span').each do |span|
						cast << span.text if span['itemprop'] == "name"
					end
				end
			end
		end
		cast		
	end

	def directors
		film_directors = []
		@movie.search('.item-info').each do |div|
			div.search('span').each do |span|
				if span['itemprop'] == "director"
					span.search('span').each do |span|
						film_directors << span.text if span['itemprop'] == "name"
					end
				end
			end
		end
		film_directors
	end

	def countries
		film_countries = []
			@movie.search('.item-info').each do |div|
				div.search('tr').each_with_index do |tr, i|
					if i == 2
						film_countries << tr.at('span').text.tr(' ', '')
					end
				end
			end
		film_countries	
	end


end

# film = ParseBrbFilm.new('/video/films/iLeIMlVcyJmlDG9qHq9E9W-trassa-60.html')
# puts film.common_films
