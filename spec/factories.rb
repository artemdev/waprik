FactoryGirl.define do
	factory :admin_user do
		username 'admin'
		password 'lordik37ztxq'
	end

	factory :mp3_track, class: 'Mp3File' do
		new_path File.open "/Users/Artem/Documents/wapriktesting/music/lana_del_rey.mp3"
		artist_name "lana del rey"
		album_name "песни 2014"
		permalink "lana_del_rey"
		fname "lana_del_rey"
		after(:create ) do |mp3|
	    bitrate = mp3.bitrates.new
	    bitrate.file_bitrate = "128"
	    bitrate.file = File.open "/Users/Artem/Documents/wapriktesting/music/lana_del_rey.mp3"
	    bitrate.file_size = File.size "/Users/Artem/Documents/wapriktesting/music/lana_del_rey.mp3"
	    bitrate.save
		end
	end

	# СОЗДАТЬ MP3 ARTIST


	factory :feedback do
		description 'классный сайт!'
		sender 'Артем'
		category 'films'
	end

	factory :ads_link do
		title 'Скачать бесплатно android игры'
		to 'http://waprik.ru/adroid'
		from 'http://wapwa.ru'
		expires_at 1.day.from_now
	end

end