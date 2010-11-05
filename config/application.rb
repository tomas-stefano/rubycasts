require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'helpers'
require 'dm-core'
require 'dm-migrations'
require 'digest/sha1'
require 'rack-flash'
require 'sinatra-authentication'


Dir["models/*.rb"].each { |model_file| require model_file }

# To install postgresql in Mac Os X run:
#
# sudo brew install postgresql
#
DataMapper.setup(:default, "postgres://localhost/rubycasts")
DataMapper.auto_migrate!



