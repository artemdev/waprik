class FFMPEGWorker
	include Sidekiq::Worker

	def perform(film_id, original_path)
		film = Film.find(film_id)
		 film.files.new.convert_to_3gp original_path
		# film.files.new.convert_to_mp4_320 original_path
		# film.files.new.convert_to_mp4_640 original_path
	end

end