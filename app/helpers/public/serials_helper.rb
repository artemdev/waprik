module Public::SerialsHelper

	def status_for serial
		if serial.updating?
		 "серии обновляются"
		else
		 "сезон закончен"
		end
	end

	def count_downloads_for serial
		@downloads = 0
		serial.series.each do |series|
				@downloads += series.dl_mp4_320 + series.dl_mp4_640 + series.dl_low_3gp
		end
		return @downloads.to_i
	end

	def title_for serial
		serial.title + " (#{serial.season} сезон)"
	end
end
