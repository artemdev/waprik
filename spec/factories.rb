FactoryGirl.define do
	factory :admin_user do
		username 'admin'
		password 'admin'
	end

	factory :mp3_track, class: 'Mp3File' do 
	end
end