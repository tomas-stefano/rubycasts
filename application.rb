require 'sinatra'
require 'erb'

set :root, File.dirname(__FILE__)

class RubyCasts
  get '/' do
    erb :index
  end
  get '/about' do
    erb :about
  end
end