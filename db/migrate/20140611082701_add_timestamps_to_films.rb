class AddTimestampsToFilms < ActiveRecord::Migration
  def up
  	# films
  	rename_column :films, :news_time, :created_at
   	add_column :films, :updated_at, :datetime

   	# films_actors
  	add_column :films_actors, :created_at, :datetime
   	add_column :films_actors, :updated_at, :datetime

   	# films_qualities
  	add_column :films_qualities, :created_at, :datetime
   	add_column :films_qualities, :updated_at, :datetime

   	# films_parts
  	add_column :films_parts, :created_at, :datetime
   	add_column :films_parts, :updated_at, :datetime

   	# films_trailers
  	add_column :films_trailers, :created_at, :datetime
   	add_column :films_trailers, :updated_at, :datetime
   	
   	# films_actors_through
  	add_column :films_actors_through, :created_at, :datetime
   	add_column :films_actors_through, :updated_at, :datetime

    # films_formats
  	add_column :films_formats, :created_at, :datetime
   	add_column :films_formats, :updated_at, :datetime

    # films_translations
  	add_column :films_translations, :created_at, :datetime
   	add_column :films_translations, :updated_at, :datetime

    # films_genres_through
  	add_column :films_genres_through, :created_at, :datetime
   	add_column :films_genres_through, :updated_at, :datetime

   #  # films_directors
  	# add_column :films_directors, :created_at, :datetime
   # 	add_column :films_directors, :updated_at, :datetime

    # films_genres
  	add_column :films_genres, :created_at, :datetime
   	add_column :films_genres, :updated_at, :datetime

    # films_directors_through
  	add_column :films_directors_through, :created_at, :datetime
   	add_column :films_directors_through, :updated_at, :datetime

    # films_files
  	add_column :films_files, :created_at, :datetime
   	add_column :films_files, :updated_at, :datetime

  end
end
