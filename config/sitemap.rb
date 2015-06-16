require 'rubygems'
require 'sitemap_generator'
# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://waprik.org'

SitemapGenerator::Sitemap.create do
  add "/", :priority => 0.5, :changefreq => 'daily'
  Film.find_each do |film|
    add film_path(film.permalink), lastmod: film.updated_at
  end
  
  FilmGenre.find_each do |genre|
    add film_genre_path(genre), lastmod: film.updated_at
  end

  add "/music", :priority => 0.7, :changefreq => 'daily'

  Mp3File.find_each do |track|
    add music_path(track.permalink), lastmod: track.created_at
  end  

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end

SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks

