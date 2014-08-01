FactoryGirl.define do
	factory :admin_user do
		username 'admin'
		password 'lordik37ztxq'
	end

	factory :mp3_track, class: 'Mp3File' do 
	end

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