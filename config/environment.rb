# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Waprik::Application.initialize!

Waprik::Application.configure do
	config.autoload_paths += %W(#{config.root}/app/concerns)
end
