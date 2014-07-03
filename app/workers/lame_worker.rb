class LameWorker
	include Sidekiq::Worker

	# конвертация музыки
	def perform(track_id)
		track = Mp3File.find(track_id)
		track.create_128kbs
 		track.create_64kbs
	end

end