require 'fileutils'
@count = 0
	root_folder = File.join("/home/artem/waprik", "public", "uploads", "video")
	Dir.chdir root_folder

# 2. Переименовать все файлы JPG
	Dir.glob("**/*.jpg").each do |pic|
	path = File.join(root_folder, File.dirname(pic))
	id_path = File.dirname(pic).split('/').map {|c| if c == "screen"; c = "cover"; else c = c; end }.join('/')
	# 	File.join(root_folder, File.dirname(pic)).split('/').map! do |path_word|
	# 		path_word == "cover" if path_word = "screen"
	# 	end
	if path.split('/').last != "cover"
		File.rename File.join(root_folder, File.dirname(pic)), File.join(root_folder, id_path)
	end

	# FileUtils.mv File.join(root_folder, File.dirname(pic)), new_name
	array = File.basename(pic, ".jpg").split("_")
	current_dir = Dir.chdir(File.join(root_folder, File.dirname(pic)))
	if array[0] == "mini"
		new_name = File.rename (File.join(root_folder, pic)), "mini_cover.jpg"
		@count += 1
  elsif array[0] == "preview"
	 	File.rename (File.join(root_folder, pic)), "preview_cover.jpg"
		@count += 1
	else
		new_name = File.rename (File.join(root_folder, pic)), "cover.jpg"
		@count += 1
	end
end
# puts "Успешно Переименовано " + @count.to_s + " файлов"


# files.map! do |picture|
# 	path = File.absolute_path picture

# 	# Берем имя найденного JPG файла без разрешения (class: File)
# 	old_name = File.basename(path, ".jpg")

# 	# Разбить строку на слова и заменить всё (кроме "mini", "preview", "_") на cover (class: File)
# 	old_name = old_name.split(/_/)
# 		old_name.map! do |c|
# 				if c == "mini"
# 					c = "mini"
# 				elsif c == "preview"
# 					c = "preview"
# 				else
# 				c = "cover"
# 			end
# 		end
# 	old_name.join("_")
# 	puts old_name
# end
