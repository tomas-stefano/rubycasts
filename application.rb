require 'rubygems'
require 'sinatra'
require 'erb'
require 'helpers'
require 'dm-core'
require 'dm-migrations'
require 'digest/sha1'
require 'rack-flash'
require 'sinatra-authentication'

class RubyCasts

  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/test.db")
  DataMapper.auto_migrate!
  
  use Rack::Session::Cookie, :secret => "heyhihello"
  use Rack::Flash

  set :environment, 'development'
  set :views, Proc.new { File.join(root, "views") }
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }
  set :public, Proc.new { File.join(root, "public") }

  helpers do
    include Rubycasts::Helpers
  end

  get '/' do
    erb :index
  end

  get '/about' do
    erb :about
  end
end
