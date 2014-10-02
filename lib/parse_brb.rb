require 'mechanize'
require 'open-uri'

class ParseBrb
	# TODO преобразовать массивы в хеши

	SOURCE_URL = 'http://brb.to'

	def initialize url
		agent = Mechanize.new
		@page = agent.get url
	end

	def ru_title
		@page.search('.b-tab-item__title').each do |div|
			ru_title = div.at('span').text.strip
		end
		ru_title
	end

	def eng_title
		@page.at('.b-tab-item__title-origin').text
	end

	def genres
		film_genres = []
		@page.search('.item-info').each do |i|
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
		years = ""
		@page.search('.item-info').each do |div|
			div.search('tr').each_with_index do |tr, i|
				if i == 1
					years = tr.at('span').text
				end
			end
		end
		years
	end

	def cover
		cover_image = ""
		@page.search('.poster-main').each do |div|
			cover_image = div.at('img')['src']
		end
		cover_image
	end

	def about
		@page.at('p.item-decription').text
	end

	def common_films
		films = []
		@page.search('.b-poster-new').each do |poster|
			films << [poster.at('.b-poster-new__image-poster')['style'].split("background-image: url(").last.tr('));\'',''), poster.at('.m-poster-new__short_title').text, "#{SOURCE_URL}#{poster.at('a')['href']}"]
		end
		# cover, title, link
		puts films
	end

	def actors
		cast = []
		@page.search('.item-info').each do |div|
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
		directors = []
		@page.search('.item-info').each do |div|
			div.search('span').each do |span|
				if span['itemprop'] == "director"
					span.search('span').each do |span|
						directors << span.text if span['itemprop'] == "name"
					end
				end
			end
		end
		directors
	end

	def countries
		countries = []
			@page.search('.item-info').each do |div|
				div.search('tr').each_with_index do |tr, i|
					if i == 2
						countries << tr.at('span').text.tr(' ', '')
					end
				end
			end
		countries	
	end

	def search line
	end

end

puts ParseBrb.new("http://fs.to/video/films/i4FEmDRctTCKuaMwJrWFsqc-oblivion.html").countries
