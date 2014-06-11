class AddFilmsColumns < ActiveRecord::Migration
    def change
	  # films
		create_table :films do |t|
	  	t.integer "item_id"
	    t.string  "title"
	    t.integer "user_id"
	    t.boolean "is_favourite"
	    t.text    "about"
	    t.integer "duration_hours"
	    t.integer "duration_minutes"
	    t.integer "duration_seconds"
	    t.integer "time"
	    t.integer "downloads", default: 0
	    t.string  "world_estimate"
	    t.string  "cis_estimate"
	    t.integer "last_download_time"
	    t.string  "prepare_status"
	    t.string  "file_name"
	    t.integer "month"
	    t.integer "year"
	    t.integer "quality_id"
	    t.integer "translation_id"
	    t.integer "count_likes", default: 0
	    t.integer "count_comments", default: 0
	    t.integer "news_time"
		end

	  add_index "films", "downloads"
	  add_index "films", "is_favourite"
	  add_index "films", "last_download_time"
	  add_index "films", "month"
	  add_index "films", "news_time"
	  add_index "films", "quality_id"
	  add_index "films", "time"
	  add_index "films", "title"
	  add_index "films", "translation_id"
	  add_index "films", "user_id"
	  add_index "films", "year"
      # add_index "films", "created_at"

	# films_actors
	create_table :films_actors do |t|
    	t.string :name
      # t.timestamps
    end

    add_index :films_actors, :name	  

    # films_qualities
    create_table :films_qualities do |t|
    	t.string :title
      # t.timestamps
    end

    add_index :films_qualities, :title	 
        
    # films_parts
		create_table :films_parts do |t|
    	t.integer :film_id
    	t.integer :file_id
    	t.integer :format_id
    	t.integer :duration
    	t.integer :size
    	t.integer :downloads
    	t.integer :num
    	t.string :real_name
      # t.timestamps
    end

    add_index :films_parts, :film_id
    add_index :films_parts, :file_id
    add_index :films_parts, :format_id
    add_index :films_parts, :downloads
    add_index :films_parts, :num

    #films_trailers
	create_table :films_trailers do |t|
    	t.integer :film_id
        t.string :filename
        t.string :filesize
      # t.timestamps
    end
    add_index :films_trailers, :film_id
    add_index :films_trailers, :filename
    add_index :films_trailers, :filesize

    # films_actors_through
 	create_table :films_actors_through do |t|
    	t.integer :film_id
    	t.integer :actor_id
      # t.timestamps
    end
    add_index :films_actors_through, :film_id
    add_index :films_actors_through, :actor_id

    # films_formats
  	create_table :films_formats do |t|
    	t.string :ext
    	t.string :title
    	t.string :description
      # t.timestamps
    end
    add_index :films_formats, :ext
    add_index :films_formats, :title 
    add_index :films_formats, :description

    # films_translations
 	create_table :films_translations do |t|
    	t.string :title
      # t.timestamps
    end

    add_index :films_translations, :title

    # films_genres_through   
 	create_table :films_genres_through do |t|
    	t.integer :film_id
    	t.integer :genre_id
      # t.timestamps
    end

    add_index :films_genres_through, :film_id
    add_index :films_genres_through, :genre_id  

		# films_genres
  	create_table :films_genres do |t|
    	t.string :title
      # t.timestamps
    end

    add_index :films_genres, :title

    # films_directors
    create_table :films_directors do |t|
    	t.string :name
      # t.timestamps
    end

    add_index :films_directors, :name

    # films_directors_throughs
    create_table :films_directors_through do |t|
    	t.integer :film_id
    	t.integer :director_id
      # t.timestamps
    end

    add_index :films_directors_through, :film_id
    add_index :films_directors_through, :director_id

    # films_files
    create_table :films_files do |t|
    	t.integer :film_id
    	t.integer :format_id
    	t.string :title
    	t.string :real_name
    	t.integer :size
    	t.string :ext
      # t.timestamps
    end

    add_index :films_files, :film_id
    add_index :films_files, :format_id
    add_index :films_files, :ext
    add_index :films_files, :size
    add_index :films_files, :title
    add_index :films_files, :real_name

  end
end
