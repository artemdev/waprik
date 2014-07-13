class FFMPEGWorker
	include Sidekiq::Worker

	def perform(id, path)
		film = Film.find(id)
		film.files.new.convert_to_3gp path
		film.files.new.convert_to_mp4_320 path
		film.files.new.convert_to_mp4_640 path
	end

end