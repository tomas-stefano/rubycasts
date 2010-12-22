class RubyCasts
  include AuthenticationRequests
  extend ApplicationLogger
  
  use Rack::Flash
  use Rack::ShowExceptions
  use Rack::CommonLogger, logger_file!
  
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
  set :views, Proc.new { File.join(root, 'app', "views") }
  set :public, Proc.new { File.join(root, "public") }
  set :logging, false
  
  enable :sessions
  
  helpers do
    include Helpers
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
  
end
