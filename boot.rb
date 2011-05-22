
period_dir = File.expand_path('.')
$LOAD_PATH.unshift(period_dir) unless $LOAD_PATH.include?(period_dir)

begin
  require File.expand_path(".bundle/environment", __FILE__)
rescue LoadError
  require "rubygems"
  require "bundler"

  Bundler.setup(:default)
end

Bundler.require

require 'config/environment'
Configuration.config do |config|
  config.logger_filename = "logs/rubycasts.log"
  config.load_paths = %w(. app/models app/helpers app/views app/lib app/requests)
  config.datamapper(:default, "postgres://localhost/rubycasts")
end
