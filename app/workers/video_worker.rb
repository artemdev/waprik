class VideoWorker
	include Sidekiq::Worker

	def perform(video_id, path, quality_id, count)
		video = Video.find(video_id)
		video.files.new.convert_to_3gp path, quality_id
		video.files.new.convert_to_mp4_320 path, quality_id
		video.files.new.convert_to_mp4_640 path, quality_id
	end
		
end