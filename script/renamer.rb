	# root_folder = File.join("/home/artem/waprik", "public", "uploads", "videos")
	# Dir.chdir root_folder

	# Dir.glob("**/*.jpg").each do |pic|
	# 	id = File.dirname(pic).split('/').first
	# 		if id == "2"
	# 			File.rename (File.join(root_folder, pic)), "snapshot20131216200936.jpg"
	# 		# elsif id == 3
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 		# elsif id == 4
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 		# elsif id == 5
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 		# elsif id == 6
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 		# elsif id == 7
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 		# elsif id == 8
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 		# elsif id == 9
	# 		# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
	# 	end
	# end

	# path = File.join(root_folder, File.dirname(pic))
	# id_path = File.dirname(pic).split('/').map {|c| if c == "screen"; c = "cover"; else c = c; end }.join('/')
	# # 	File.join(root_folder, File.dirname(pic)).split('/').map! do |path_word|
	# # 		path_word == "cover" if path_word = "screen"
	# # 	end
	# if path.split('/').last != "cover"
	# 	File.rename File.join(root_folder, File.dirname(pic)), File.join(root_folder, id_path)
	# end

	# # FileUtils.mv File.join(root_folder, File.dirname(pic)), new_name
	# array = File.basename(pic, ".jpg").split("_")
	# current_dir = Dir.chdir(File.join(root_folder, File.dirname(pic)))
	# if array[0] == "mini"
	# 	new_name = File.rename (File.join(root_folder, pic)), "mini_cover.jpg"
	# 	@count += 1
 #  elsif array[0] == "preview"
	#  	File.rename (File.join(root_folder, pic)), "preview_cover.jpg"
	# 	@count += 1
	# else
	# 	new_name = File.rename (File.join(root_folder, pic)), "cover.jpg"
	# 	@count += 1
	# end
	# end

# 20 /uploads/videos/20/cover/ 
# 21 /uploads/videos/21/cover/ 
# 22 /uploads/videos/22/cover/ 
# 23 /uploads/videos/23/cover/ 
# 24 /uploads/videos/24/cover/ 
# 25 /uploads/videos/25/cover/ 
# 26 /uploads/videos/26/cover/ 
# 27 /uploads/videos/27/cover/ 
# 28 /uploads/videos/28/cover/ 
# 29 /uploads/videos/29/cover/ 
# 30 /uploads/videos/30/cover/ 
# 31 /uploads/videos/31/cover/ 
# 32 /uploads/videos/32/cover/ 
# 33 /uploads/videos/33/cover/ 
# 34 /uploads/videos/34/cover/ 
# 35 /uploads/videos/35/cover/ 
# 36 /uploads/videos/36/cover/ 
# 37 /uploads/videos/37/cover/ 