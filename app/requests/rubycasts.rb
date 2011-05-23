require 'omni_auth_requests'
require 'episodes_requests'

class RubyCasts
  include OmniAuthRequests
  extend ApplicationLogger
  
  use Rack::Flash
  use Rack::ShowExceptions
  use Rack::CommonLogger, logger_file!
  use OmniAuth::Strategies::GitHub, Configuration.omni_auth[:client_id], Configuration.omni_auth[:secret]
  
  configure do
    set :root, File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
    set :views, Proc.new { File.join(root, 'app', "views") }
    set :public, Proc.new { File.join(root, "public") }
    set :logging, false
  end
  
  enable :sessions
  
  helpers do
    include Helpers
  end

  get '/' do
    @episodes = Episode.first_five_in_desc_order
    haml :index
  end

  get '/about' do
    haml :about
  end
  
  get '/dashboard' do
    haml :dashboard
  end
  
  get '/feeds.xml' do
    @episodes = Episode.all
    builder do |xml|
      xml.instruct! :xml, :version => '1.0'
      xml.rss :version => "2.0" do
        xml.channel do
          xml.title "Rubycasts"
          xml.description "Rubycasts is a screencast site about the Ruby World produced by Tomas D'Stefano(@tomas_stefano) and every week will be release an episode! =D"
          xml.link "http://rubycasts.com.br/"
      
          @episodes.each do |episode|
            xml.item do
              xml.title episode.title
              xml.link "http://rubycasts.com.br/episodes/#{episode.id}"
              xml.description episode.description
              xml.pubDate Time.parse(episode.created_at.to_s).rfc822()
              xml.guid "http://rubycasts.com.br/episodes/#{episode.id}"
            end
          end
          
        end
      end
    end
  end
  
end
