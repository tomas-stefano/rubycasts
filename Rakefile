period_dir = File.expand_path('.')
$LOAD_PATH.unshift(period_dir) unless $LOAD_PATH.include?(period_dir)

require 'rake'
require 'boot'

desc 'Open the Console'
task :console do
  require 'irb'
  require 'boot'
  ARGV.clear
  IRB.start
end

desc 'Bootstrap application with some data (Like db:seed from Rails)'
task :bootstrap do
  comments = 10.times.map{|i| Comment.create!(:body => "#{1} Lorem ipsum dolor sit amet") }

  Episode.create! :title => "Ruby on Rails",
                  :description => "The new Rails might seem like magic at first. But in this episode I unravel how it works by browsing the Rails 3 source code.",
                  :video_mp4_uri => "http://video-js.zencoder.com/oceans-clip.mp4",
                  :video_ogg_uri => "http://video-js.zencoder.com/oceans-clip.ogg",
                  :video_webm_uri => "http://video-js.zencoder.com/oceans-clip.webm",
                  :duration => "3:40",
                  :notes => "Aidmock source: [https://github.com/wilkerlucio/aidmock](https://github.com/wilkerlucio/aidmock)\nEpisode source: [http://github.com/tomas-stefano/](http://github.com/tomas-stefano/)",
                  :image => 'http://dl.dropbox.com/u/4100835/rubycasts/01_aidmock.png',
                  :comments => comments


  Episode.create! :title => "Active Record 3",
                  :description => "The new Active Record query methods in Rails 3 might seem like magic at first. But in this episode I unravel how it works by browsing the Rails 3 source code.",
                  :video_mp4_uri => "http://video-js.zencoder.com/oceans-clip.mp4",
                  :video_ogg_uri => "http://video-js.zencoder.com/oceans-clip.ogg",
                  :video_webm_uri => "http://video-js.zencoder.com/oceans-clip.webm",
                  :duration => "2:40",
                  :notes => "Aidmock source: [https://github.com/wilkerlucio/aidmock](https://github.com/wilkerlucio/aidmock)\nEpisode source: [http://github.com/tomas-stefano/](http://github.com/tomas-stefano/)",
                  :image => 'http://dl.dropbox.com/u/4100835/rubycasts/01_aidmock.png',
                  :comments => comments
end
