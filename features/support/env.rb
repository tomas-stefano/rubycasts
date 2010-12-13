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
end

World do
  RubyCastsWorld.new
end
