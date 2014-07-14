class FFMPEGWorker
	include Sidekiq::Worker

	def perform(film_id, path, quality_id)
		film = Film.find(film_id)
		film.files.new.convert_to_3gp path, quality_id
		film.files.new.convert_to_mp4_320 path, quality_id
		film.files.new.convert_to_mp4_640 path, quality_id
	end

end