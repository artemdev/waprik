class SerialsWorker
	include Sidekiq::Worker

	def perform(id, file_path, quality_id, count)
		serie = Series.find(id)
		Convertation.to_3gp(serie.files.new, file_path, quality_id)
		Convertation.to_mp4_320(serie.files.new, file_path, quality_id)
		Convertation.to_mp4_640(serie.files.new, file_path, quality_id)
	end

end