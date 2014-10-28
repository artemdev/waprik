require 'mechanize'
require 'open-uri'

class ParseBrbSearch
	# TODO преобразовать массивы в хеши

	SOURCE_URL = 'http://brb.to'

	def initialize keywords=""
		agent = Mechanize.new
		search = agent.get SOURCE_URL
		form = search.forms.first
		form.search = keywords
		@search_results = form.submit		
	end

	def results
		results = []
		@search_results.search('.main').each do |m|
			m.search('tr').each_with_index do |tr, index|
					tr.search('td').each do |td|
						if td.at('a.title') && td.at('.section').text == "Фильмы"
						results << [td.at('a.title').text, td.at('a.title')['href'] ]
						end
					end
			end
		end
		if results.any?
			results
		else
			"ничего не найдено"
		end	
	end

end

# puts ParseBrbSearch.new("Трасса 60").results.last.last
