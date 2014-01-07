# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Waprik::Application.initialize!

# Rails mode 
ENV['RAILS_ENV'] ||= 'production'
