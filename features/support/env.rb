ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'config', 'application')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

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
  URIS = ['http://media.rubycasts.com/videos/1_benchmark.mov', 'http://media.rubycasts.com/videos/1_profiler.mov']
  
  def create_an_episode_instance
    episode = Episode.new
    episode.title = random_element(TITLES)
    episode.description = random_element(DESCRIPTIONS)
    episode.video_uri = random_element(URIS)
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
