task :transform_downloads => :environment do
	Mp3File.all.each do |mp3_file|
		 mp3_file.download.times { mp3_file.downloads.create!(user_agent: 'admin initial') }
		 mp3_file.download = 0
	end

	Film.all.each do |film|
		 film.download.times { film.downloads.create!(user_agent: 'admin initial') }
		 mp3_file.download = 0
	end

	SerialSerieFile.all.each do |serial|
		 serial.download.times { serial.downloads.create!(user_agent: 'admin initial') }
		 mp3_file.download = 0
	end
end