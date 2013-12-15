 class Test

 def translit(name)
		# Беремя строку "name" и разбиваем ее на символы
		name.each_char.to_a.map do |char|
			# Транслитируем найденные русские символы
			if char == "а"; char = "a"; end
			if char == "б"; char = "b"; end
			if char == "в"; char = "v"; end
			if char == "г"; char = "g"; end
			if char == "д"; char = "d"; end
			if char == "е"; char = "e"; end
			if char == "ё"; char = "yo"; end
			if char == "ж"; char = "zh"; end
			if char == "з"; char = "z"; end
			if char == "и"; char = "i"; end
			if char == "й"; char = "j"; end
			if char == "к"; char = "k"; end
			if char == "л"; char = "l"; end
			if char == "м"; char = "m"; end
			if char == "н"; char = "n"; end
			if char == "о"; char = "o"; end
			if char == "п"; char = "p"; end
			if char == "р"; char = "r"; end
			if char == "с"; char = "c"; end
			if char == "т"; char = "t"; end
			if char == "у"; char = "u"; end
			if char == "х"; char = "h"; end
			if char == "ф"; char = "f"; end
			if char == "ц"; char = "c"; end
			if char == "ч"; char = "ch"; end
			if char == "ш"; char = "sh"; end
			if char == "щ"; char = "w"; end
			if char == "ъ"; char = "qq"; end
			if char == "у"; char = "u"; end
			if char == "ы"; char = "y"; end
			if char == "ь"; char = "q"; end
			if char == "э"; char = "eh"; end
			if char == "ю"; char = "yu"; end
			if char == "я"; char = "ya"; end
			if char == " "; char = "_"; end
		end
	# Возвращаем транслитированную "name"
	return name.to_s
  end

end

puts Test.translit("аб")