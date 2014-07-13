class LameWorker
	include Sidekiq::Worker

	# конвертация музыки
	def perform(id)
		track = Mp3File.find(id)
		track.create_128kbs
 		track.create_64kbs
	end
end