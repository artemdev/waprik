class Admin::FtpFilesController < ApplicationController
	layout 'admin'

	before_filter :confirm_logged_in

	FILMS_FOLDER = 'public/ftp/films/'
	MUSIC_FOLDER = 'public/ftp/music/'

	# показываются все файлы на ftp
	def index
		@files = get_files
	end

	# сканируются ftp имена и заменяются ненужные символы
	def rename_films
		Dir.glob(FILMS_FOLDER + "*").sort.each do |f|
			filename = File.basename(f, File.extname(f))
			File.rename(f, FILMS_FOLDER + filename.gsub("'", "").gsub("&", "and") + File.extname(f))
		end
		render text: "ok"
	end

	def rename_music
		Dir.glob(MUSIC_FOLDER + "*").sort.each do |f|
			filename = File.basename(f, File.extname(f))
			File.rename(f, MUSIC_FOLDER + filename.gsub("'", "").gsub("&", "and") + File.extname(f))
		end
		render text: "ok"
	end

end
