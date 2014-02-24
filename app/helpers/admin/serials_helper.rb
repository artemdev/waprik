module Admin::SerialsHelper
	def status_for serial
		if serial.updating?
		 "серии обновляются"
		else
		 "сезон закончен"
		end
	end

	def count_downloads_for serial
		serial.series.each do |series|
				@downloads = series.dl_mp4_320 + series.dl_mp4_640 + series.dl_low_3gp
		end
		return @downloads.to_i
	end
end
