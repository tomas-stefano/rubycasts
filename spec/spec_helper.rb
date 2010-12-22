sinatra_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(sinatra_root) unless $LOAD_PATH.include?(sinatra_root)

require 'boot'
Bundler.setup(:test)
Bundler.require(:test)

set :environment, :test
configure :test do
  DataMapper.setup(:test, "postgres://localhost/rubycasts_test")
end

DataMapper.repository :test

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each) do
    DataMapper.auto_migrate!
  end
end
