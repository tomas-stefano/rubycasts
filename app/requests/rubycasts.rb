class RubyCasts
  include AuthenticationRequests
  include Settings
  
  helpers do
    include RubyCasts::Helpers
  end

  get '/' do
    @episodes = Episode.all
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

  post '/proposta' do
  end

end
