require 'config/application'

# It's good to decide how tools we shall use!

# This is my opinion:
#
# ORM: Datamapper
# Database: PostgreSQL
# Views: Erb
# 

# I put this choices in Gemfile. 
# Let's decide together and modified if is really necessary.

# Persist the videos?
# I don't know for sure, but let's start with this choice.

class RubyCasts

  use Rack::Session::Cookie, :secret => "heyhihello"
  use Rack::Flash

  set :root, File.dirname(__FILE__)
  set :environment, 'development'
  set :views, Proc.new { File.join(root, "views") }
  set :public, Proc.new { File.join(root, "public") }

  helpers do
    include Rubycasts::Helpers
  end

  get '/' do
    haml :index
  end

  get '/about' do
    haml :about
  end

	get '/contact' do
		haml :contact
	end

  get '/admin/upload' do
      haml :upload
  end

  get '/stylesheets/application.css' do
    content_type "text/css"
    sass :application
  end

end
