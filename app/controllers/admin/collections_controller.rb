class Admin::CollectionsController < ApplicationController

	before_filter :confirm_logged_in

	def index
		@collections = Collection.all
	end
	def show
	end

### ВИДЕО КОЛЛЕКЦИИ ###

	def video # Показ видео колллекции
	end

	def new_video_category # Создаем видео колллекции(Шаг 1)
	end

	def create_video_category # Создаем видео колллекцию (Шаг 2)
	end

	def edit_video_category # Редактирование видео колллекции (Шаг 1)
	end

	def update_video_category # Редактирование видео колллекции (Шаг 2)
	end

	def destroy_video_category # Удаление видео колллекции
	end

### МУЗЫКАЛЬНЫЕ КАТЕГОРИИ ###

	def music # Показ музыкальной колллекции
	end

	def new_music_category # Создаем музыкальную колллекцию (Шаг 1)
	end

	def create_music_category # Создаем музыкальную колллекцию (Шаг 2)
	end

	def edit_music_category # Редактирование музыкальной колллекции (Шаг 1)
	end

	def update_music_category # Редактирование музыкальной колллекции (Шаг 2)
	end

	def destroy_music_category # Удаление музыкальной колллекции
	end

end
