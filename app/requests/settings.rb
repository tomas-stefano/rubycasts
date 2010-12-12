$root_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
module Settings
  use Rack::Session::Cookie, :secret => "3dd410929706203fe6fe008ca1cc721450609746"
  use Rack::Flash
  use Rack::ShowExceptions

  set :root, $root_path
  set :environment, 'development'
  set :views, Proc.new { File.join(root, 'app', "views") }
  set :public, Proc.new { File.join(root, "public") }

  set :logging, false
  LOGGER_FILE = File.open("rubycasts.log", 'a+')
  LOGGER_FILE.sync = true
  use Rack::CommonLogger, LOGGER_FILE
end

