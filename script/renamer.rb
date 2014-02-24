	root_folder = File.join("/home/artem/waprik", "public", "uploads", "videos")
	Dir.chdir root_folder

	Dir.glob("**/*.jpg").each do |pic|
		id = File.dirname(pic).split('/').first
			if id == 2
				File.rename File.join(root_folder, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 3
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 4
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 5
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 6
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 7
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 8
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
			# elsif id == 9
			# 	File.rename File.join(root_path, id, "cover/cover.jpg"), "snapshot20131216200936.jpg"
		end
	end

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

# 2 /uploads/videos/2/cover/snapshot20131216201047.jpg 
# 3 /uploads/videos/3/cover/snapshot20131216201110.jpg 
# 4 /uploads/videos/4/cover/snapshot20131216201217.jpg 
# 5 /uploads/videos/5/cover/snapshot20131216201308.jpg 
# 6 /uploads/videos/6/cover/snapshot20131216201417.jpg 
# 7 /uploads/videos/7/cover/snapshot20131216201452.jpg 
# 8 /uploads/videos/8/cover/snapshot20131216201525.jpg 
# 9 /uploads/videos/9/cover/snapshot20131216201548.jpg 

# 20 /uploads/videos/20/cover/snapshot20140109000504.jpg 
# 21 /uploads/videos/21/cover/snapshot20140109000536.jpg 
# 22 /uploads/videos/22/cover/snapshot20140109004305.jpg 
# 23 /uploads/videos/23/cover/snapshot20140110224343.jpg 
# 24 /uploads/videos/24/cover/snapshot20140110224636.jpg 
# 25 /uploads/videos/25/cover/snapshot20140110224807.jpg 
# 26 /uploads/videos/26/cover/snapshot20140110224948.jpg 
# 27 /uploads/videos/27/cover/snapshot20140110225111.jpg 
# 28 /uploads/videos/28/cover/snapshot20140207104934.jpg 
# 29 /uploads/videos/29/cover/snapshot20140207105204.jpg 
# 30 /uploads/videos/30/cover/snapshot20140207105307.jpg 
# 31 /uploads/videos/31/cover/snapshot20140207105330.jpg 
# 32 /uploads/videos/32/cover/snapshot20140207105448.jpg 
# 33 /uploads/videos/33/cover/snapshot20140208184558.jpg 
# 34 /uploads/videos/34/cover/snapshot20140208184756.jpg 
# 35 /uploads/videos/35/cover/snapshot20140208184740.jpg 
# 36 /uploads/videos/36/cover/snapshot20140208184723.jpg 
# 37 /uploads/videos/37/cover/snapshot20140208184701.jpg 