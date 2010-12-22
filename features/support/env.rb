ENV['RACK_ENV'] = 'test'

period = File.dirname(__FILE__)
require File.expand_path(File.join(period, '..', '..', 'boot'))
Bundler.require(:test)
require 'capybara/cucumber'

DatabaseCleaner.strategy = :truncation
Capybara.app = Sinatra::Application

class RubyCastsWorld
  include Capybara
  include RSpec::Expectations
  include RSpec::Matchers
  def video_episode_file
    File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'upload_video.png'))
  end
  
  TITLES = ["RubyCasts", "Capybara", "Ruby", "Rails", "Sinatra", "Merb", "EventMachine"]
  DESCRIPTIONS = ["About Capybara", "About Ruby", "About Rails", "About Sinatra", "About EventMachine"]
  URIS = ['http://media.rubycasts.com/videos/1_benchmark.mp4', 'http://media.rubycasts.com/videos/1_profiler.ogg']
  
  def create_an_episode_instance
    episode = Episode.new
    episode.title = random_element(TITLES)
    episode.description = random_element(DESCRIPTIONS)
    
    episode.video_mp4_uri = random_element(URIS)
    episode.video_webm_uri = random_element(URIS)
    episode.video_ogg_uri = random_element(URIS)
            
    episode.duration = '6:09'
    episode  
  end
  
  def random_element(array)
    array[rand(array.size)]
  end
end

World do
  RubyCastsWorld.new
end

Before do
  DatabaseCleaner.clean
end

at_exit do
  DatabaseCleaner.clean
end
