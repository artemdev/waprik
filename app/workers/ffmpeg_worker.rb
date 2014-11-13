class FFMPEGWorker
	include Sidekiq::Worker

	def perform(film_id, path, quality_id, count)
		film = Film.find(film_id)
		film.files.new.convert_to_3gp path, quality_id
		film.files.new.convert_to_mp4_320 path, quality_id
		film.files.new.convert_to_mp4_640 path, quality_id
	end

	def perform(id, file_path, quality_id, count)
		film = Film.find(id)
		convertation = VideoConvertation.new
		convertation.film_to_3gp(film.files.new, file_path, quality_id)
		convertation.film_to_mp4_320(film.files.new, file_path, quality_id)
		convertation.film_to_mp4_640(film.files.new, file_path, quality_id)
		film.make_visible! unless film.visible?
		# TODO 17.10 добавить фильм в паблик vk
		# film.push_to_vk!
	end
		
end