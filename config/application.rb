require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'dm-core'
require 'dm-migrations'
require 'digest/sha1'
require 'rack-flash'

class Application
  class Configuration
    def load_paths=(dirs)
      dirs.each do |dir|
        directory = File.expand_path(dir)
        $LOAD_PATH.unshift(directory) unless $LOAD_PATH.include?(directory)
        Dir["#{directory}/*.rb"].each { |file| require file }
      end
    end
  end
  
  def self.config
    yield Configuration.new
  end
end

Application.config do |config|
  config.load_paths = %w(. app/models app/helpers app/views app/requests)  
end

# To install postgresql in Mac Os X run:
#
# sudo brew install postgresql
#
DataMapper.setup(:default, "postgres://localhost/rubycasts")
DataMapper.auto_migrate!



