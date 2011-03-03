period_dir = File.expand_path('.')
$LOAD_PATH.unshift(period_dir) unless $LOAD_PATH.include?(period_dir)

require 'rake'
require 'boot'

desc 'Open the Console'
task :console do
  system("ruby -I. -S bundle console")
end

desc 'Bootstrap application with some data (Like db:seed from Rails)'
task :bootstrap do
  comments = 10.times.map{|i| Comment.create!(:body => "#{1} Lorem ipsum dolor sit amet", :author => "You my friend!") }

  Episode.create! :title => "Ruby on Rails",
                  :description => "The new Rails might seem like magic at first. But in this episode I unravel how it works by browsing the Rails 3 source code.",
                  :video_mp4_uri => "http://video-js.zencoder.com/oceans-clip.mp4",
                  :video_ogg_uri => "http://video-js.zencoder.com/oceans-clip.ogg",
                  :video_webm_uri => "http://video-js.zencoder.com/oceans-clip.webm",
                  :duration => "3:40",
                  :comments => comments


  Episode.create! :title => "Active Record 3",
                  :description => "The new Active Record query methods in Rails 3 might seem like magic at first. But in this episode I unravel how it works by browsing the Rails 3 source code.",
                  :video_mp4_uri => "http://video-js.zencoder.com/oceans-clip.mp4",
                  :video_ogg_uri => "http://video-js.zencoder.com/oceans-clip.ogg",
                  :video_webm_uri => "http://video-js.zencoder.com/oceans-clip.webm",
                  :duration => "2:40",
                  :comments => comments
end
