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
		serial.series.files.each do |file|
			downloads += file.downloads
		end
		downloads
	end
end
