module Public::CollectionsHelper
	
  # подсчет скачиваний в подборке
  def downloads_size_for collection
    downloads = 0
    if collection.tracks.any?
      collection.tracks.map { |track| downloads += track.downloads.size }
    end
    downloads
  end


end
