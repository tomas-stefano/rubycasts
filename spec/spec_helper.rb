sinatra_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(sinatra_root) unless $LOAD_PATH.include?(sinatra_root)

require 'boot'
Bundler.setup(:test)
Bundler.require(:test)
DatabaseCleaner.strategy = :truncation

Configuration.config do |config|
  config.datamapper(:default, "postgres://localhost/rubycasts_test")
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  
  config.before(:each) do
    DatabaseCleaner.clean
  end
end
