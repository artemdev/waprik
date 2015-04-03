# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		User.create!(username: "artway", password: "lordik37ztxq", email: 'artwayprojects@gmail.com') unless User.find_by_username("artway")
		# quality = FilmQuality.create(title: "CAMRip", position: 0)
		FilmFormat.create!(title: "MP4 640 (хорошее качество)", description: "Для смартфонов, планшетов", ffparams: "", ext: "")
		FilmFormat.create!(title: "MP4 320 (хорошее качество)", description: "Для телефонов, смартфонов", ffparams: "", ext: "")
		FilmFormat.create!(title: "3GP (среднее качество)", description: "Для телефонов", ffparams: "", ext: "")

		# фильмы
		genre = FilmGenre.create!(title: "фантастика")
		film = genre.films.create(ru_title: "Первый фантастический", about: "первый фильм!:)", visible: true, cover: File.open(File.join(Rails.root, 'public', 'testing', 'films', 'cover.jpg')))
		# # сериалы
		# serial = Serial.create(season: 1, lang: 1, years: "2011...", description: "desc", hit: true, name: "for test", cover: File.open(File.join(Rails.root, 'public', 'testing', 'films', 'cover.jpg')))
		# serial.genres.create title: "фантастика"
		# serie = serial.series.create number: 1
		# serie.files.create quality_id: quality.id, format_id: serie.id, attach: File.open(File.join(Rails.root, 'public', 'testing', 'films', 'cover.jpg'))

		# collections
		Collection.create!(name: 'one republic')
