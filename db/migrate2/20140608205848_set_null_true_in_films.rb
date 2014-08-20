class SetNullTrueInFilms < ActiveRecord::Migration
  def up
			# films
	  	change_column_null(:films, :item_id, true)
	  	change_column_null(:films, :title, true)
	  	change_column_null(:films, :user_id, true)
	  	change_column_null(:films, :is_favourite, true)
	  	change_column_null(:films, :about, true)
	  	change_column_null(:films, :duration_hours, true)
	  	change_column_null(:films, :duration_minutes, true)
	  	change_column_null(:films, :duration_seconds, true)
	  	change_column_null(:films, :time, true)
	  	change_column_null(:films, :downloads, true)
			change_column(:films, :downloads, :integer, default: 0)
	  	change_column_null(:films, :world_estimate, true)
	  	change_column_null(:films, :cis_estimate, true)
	  	change_column_null(:films, :last_download_time, true)
	  	change_column_null(:films, :prepare_status, true)
	  	change_column_null(:films, :file_name, true)
	  	change_column_null(:films, :month, true)
	  	change_column_null(:films, :year, true)
	  	change_column_null(:films, :quality_id, true)
	  	change_column_null(:films, :translation_id, true)
	    change_column_null(:films, :count_likes, true)
	    change_column_null(:films, :count_comments, true)
	  	# films_actors
	   	change_column_null(:films_actors, :name, true)
	   	# films_actors_through
	  	change_column_null(:films_actors_through, :film_id, true)
	  	change_column_null(:films_actors_through, :actor_id, true)  	
	    # films_directors
	   	change_column_null(:films_directors, :name, true)
	   	# films_directors_through
	   	change_column_null(:films_directors_through, :film_id, true)   	
	   	change_column_null(:films_directors_through, :director_id, true)   	
	   	# films_files
	   	change_column_null(:films_files, :film_id, true)   	
	   	change_column_null(:films_files, :format_id, true)   	
	   	change_column_null(:films_files, :title, true)   	
	   	change_column_null(:films_files, :real_name, true)   	
	   	change_column_null(:films_files, :size, true)   	
	   	change_column_null(:films_files, :ext, true) 
	   	change_column_null(:films_files, :position, true) 
	   	# films_genres	
	   	change_column_null(:films_genres, :title, true)
	   	# films_genres_through
	   	change_column_null(:films_genres_through, :film_id, true)   
	   	change_column_null(:films_genres_through, :genre_id, true)  
	   	# films_parts
	    change_column_null(:films_parts, :num, true)    	
	    change_column_null(:films_parts, :file_id, true)    	
	    change_column_null(:films_parts, :film_id, true)    	
	    change_column_null(:films_parts, :format_id, true)    	
	    change_column_null(:films_parts, :real_name, true)    	
	    change_column_null(:films_parts, :duration, true)    	
	    change_column_null(:films_parts, :size, true)    	
	    change_column_null(:films_parts, :downloads, true)  	
	    # films_qualities
	    change_column_null(:films_qualities, :title, true)  	
	    # films_trailers
	    # change_column_null(:films_trailers, :film_id, true)  	
	    # change_column_null(:films_trailers, :filename, true)  	
	    # change_column_null(:films_trailers, :filesize, true)  
	    # films_translations
	    change_column_null(:films_translations, :title, true)	
  end

  def down
  end
end
