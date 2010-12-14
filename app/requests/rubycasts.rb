require File.expand_path('config/application')
require 'authentication'

class RubyCasts
  include Authentication
  include Settings
  
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

  get '/stylesheets/application.css' do
    content_type "text/css"
    sass :application
  end
  
  get '/upload_episode' do
    haml :upload_episode
  end

  post '/proposta' do
  end

end
