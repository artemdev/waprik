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
		serial.series.each do |series|
			downloads += series.downloads
		end
		return downloads
	end
end
