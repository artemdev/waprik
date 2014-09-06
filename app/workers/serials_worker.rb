class SerialsWorker
	include Sidekiq::Worker

	def perform(id, path, quality_id, count)
		serie = Series.find(id)
		serie.files.new.convert_to_3gp path, quality_id
		serie.files.new.convert_to_mp4_320 path, quality_id
		serie.files.new.convert_to_mp4_640 path, quality_id
	end

end