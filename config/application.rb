
begin
  require File.expand_path(".bundle/environment", __FILE__)
rescue LoadError
  require "rubygems"
  require "bundler"

  Bundler.setup(:default)
end

Bundler.require

require File.expand_path('config/environment')

RubyCasts.config do |config|
  config.load_paths = %w(. app/models app/helpers app/views app/requests)
  config.datamapper(:default, "postgres://localhost/rubycasts")
end




