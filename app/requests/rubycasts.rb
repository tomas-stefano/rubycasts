class RubyCasts
  include OmniAuthRequests
  extend ApplicationLogger
  
  use Rack::Flash
  use Rack::ShowExceptions
  use Rack::CommonLogger, logger_file!
  use OmniAuth::Strategies::GitHub, Configuration.omni_auth[:client_id], Configuration.omni_auth[:secret]
  
  configure do
    set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    set :views, Proc.new { File.join(root, 'app', "views") }
    set :public, Proc.new { File.join(root, "public") }
    set :logging, false
  end
  
  enable :sessions
  
  helpers do
    include Helpers
  end

  get '/' do
    @episodes = Episode.first_five_in_desc_order
    haml :index
  end

  get '/about' do
    haml :about
  end
  
  get '/dashboard' do
    haml :dashboard
  end
  
end
