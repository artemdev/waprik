module Admin::SerialsHelper
	def status_for serial
		if serial.updating?
		 "серии обновляются"
		else
		 "сезон закончен"
		end
	end

	def count_downloads_for serial
		downloads = 0
		serial.series.each do |serie|
			serie.files.each do |file|
				downloads += file.downloads
			end
		end
		downloads
	end
end
