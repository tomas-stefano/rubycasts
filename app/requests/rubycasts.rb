class RubyCasts
  include AuthenticationRequests
  include OmniAuthRequests
  extend ApplicationLogger
  
  use Rack::Flash
  use Rack::ShowExceptions
  use Rack::CommonLogger, logger_file!
  use OmniAuth::Strategies::GitHub, Configuration.omni_auth[:client_id], Configuration.omni_auth[:secret]
  
  set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
  set :views, Proc.new { File.join(root, 'app', "views") }
  set :public, Proc.new { File.join(root, "public") }
  set :logging, false
  
  enable :sessions
  
  helpers do
    include Helpers
  end

  get '/' do
    @episodes = Episode.first(6)
    haml :index
  end

  get '/about' do
    haml :about
  end
  
  get '/stylesheets/application.css' do
    content_type "text/css"
    sass :application
  end
  
end
