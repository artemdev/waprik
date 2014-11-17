require 'video_convertation'

class SerialsWorker
	include Sidekiq::Worker

	def perform(id, file_path, quality_id, count)
		serie = Series.find(id)
		convertation = VideoConvertation.new
		convertation.serial_to_3gp(serie.files.new, file_path, quality_id)
		convertation.serial_to_mp4_320(serie.files.new, file_path, quality_id)
		convertation.serial_to_mp4_640(serie.files.new, file_path, quality_id)
	end

end