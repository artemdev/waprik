class SerialsWorker
	include Sidekiq::Worker

	def perform(id, file_path, quality_id, count)
		serie = Series.find(id)
		serie.files.new.convert_to_3gp(file_path, quality_id)
		serie.files.new.convert_to_mp4_320(file_path, quality_id)
		serie.files.new.convert_to_mp4_640(file_path, quality_id)
	end

end