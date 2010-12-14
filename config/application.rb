require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'digest/sha1'
require 'rack-flash'
require 'carrierwave'
require 'logger'
require 'omniauth'
require File.expand_path('config/environment')

RubyCasts.config do |config|
  config.load_paths = %w(. app/models app/helpers app/views app/requests)
  config.datamapper(:default, "postgres://localhost/rubycasts")
end




