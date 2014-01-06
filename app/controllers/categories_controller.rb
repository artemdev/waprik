class CategoriesController < ApplicationController

	before_filter :confirm_logged_in

### ВИДЕО ###

	def video # Показ видео категории
	end

	def new_video_category # Создаем видео категорию (Шаг 1)
	end

	def create_video_category # Создаем видео категорию (Шаг 2)
	end

	def edit_video_category # Редактирование видео категории (Шаг 1)
	end

	def update_video_category # Редактирование видео категории (Шаг 2)
	end

	def destroy_video_category # Удаление видео категории
	end

### МУЗЫКАЛЬНЫЕ  ###

	def music # Показ музыкальной категории
	end

	def new_music_category # Создаем музыкальную категорию (Шаг 1)
	end

	def create_music_category # Создаем музыкальную категорию (Шаг 2)
	end

	def edit_music_category # Редактирование музыкальной категории (Шаг 1)
	end

	def update_music_category # Редактирование музыкальной категории (Шаг 2)
	end

	def destroy_music_category # Удаление музыкальной категории
	end

end
