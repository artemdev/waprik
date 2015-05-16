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
		Struct.new("Film", :title, :url)
		@search_results.links_with(class: 'b-search-page__results-item m-video').each do |link|
			film = Struct::Film.new
			# найти title фильма
			film[:title] = link.attributes.text.split("\n\t\n\t\t\n\t\t\t").first.gsub("\n\t\n\t\t\n\t\n\t\n\t\t", "")
			film[:url] = link.uri.to_s
			results << film
		end
		results
	end

end

puts ParseBrbSearch.new("back to the future").results
