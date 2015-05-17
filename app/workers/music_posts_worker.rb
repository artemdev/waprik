class MusicPostsWorker
	include Sidekiq::Worker

	def perform(post_url, collection_id)
		post = VkPost.new(post_url)
		collection = Collection.find(collection_id)
		if post.image
			collection.remote_image_url = post.image 
			collection.save
		end
		# post_image = post.image
		# ex. ['Bon Jovi', 'its my life' 'http://example.com']
		post_tracks = post.tracks
		count = 0
		post_tracks.each do |track|
			if mp3 = Mp3File.find_by_fname(track[1].parameterize)
				mp3.touch
			else
				mp3 = Mp3File.new
				mp3.set_artist_name_from track[0]
				mp3.set_name_from track[1]
				# tmp_file = open(gravatar_url) 
				mp3.remote_new_path_url = track[2]
				mp3.vk_url = track[2]
				mp3.fname = track[1].parameterize
				mp3.set_album_name_from collection.name
				mp3.save
				# id3v2 теги
				mp3.create_id3v2_tags_from mp3.name
				# конвертация
				LameWorker.perform_async(mp3.id)
				collection.tracks << mp3
				count += 1
			end
		end
	end

end