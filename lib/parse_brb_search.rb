require 'mechanize'
require 'open-uri'

class ParseBrbSearch
	# TODO преобразовать массивы в хеши

	SOURCE_URL = 'http://fs.to'

	def initialize keywords=""
		agent = Mechanize.new
		search = agent.get SOURCE_URL
		form = search.forms.first
		form.search = keywords
		@search_results = form.submit		
	end

	def results
		results = []
		@search_results.links_with(class: 'b-search-page__results-item m-video').each do |link|
			# найти title фильма
			# title = 
			url = link.uri.to_s
			results << url
		end
		results
	end

end

puts ParseBrbSearch.new("back to the future").results
