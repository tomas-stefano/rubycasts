<<<<<<< HEAD
require 'rubygems'
require 'sinatra'
require 'erb'
require 'sinatra-helpers/haml'
require 'helpers'
require 'haml'

class RubyCasts
	set :root, File.dirname(__FILE__)
	set :views, Proc.new { File.join(root, "views") }
	set :public, Proc.new { File.join(root, "public") }

	helpers do
		include Rubycasts::Helpers
	end

	not_found do
		haml :not_found
	end

	get '/' do
		haml :index
	end

  get '/about' do
    haml :about
  end
end
