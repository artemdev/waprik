# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		AdminUser.create(username: "art", password: "lordik37ztxq")
		FilmQuality.create(title: "CAMRip", position: 0)
		FilmFormat.create(title: "MP4 640 (хорошее качество)", description: "Для смартфонов, планшетов", ffparams: "", ext: "")
		FilmFormat.create(title: "MP4 320 (хорошее качество)", description: "Для телефонов, смартфонов", ffparams: "", ext: "")
		FilmFormat.create(title: "3GP (среднее качество)", description: "Для телефонов", ffparams: "", ext: "")