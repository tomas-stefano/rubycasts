class Episode
  include DataMapper::Resource

  property :id, Serial
  property :title, String,     :length => 255, :required => true
  property :description, Text, :length => 255, :required => true
  property :duration, String,  :required => true
  
  # URI for video encoding
  property :video_mp4_uri, String,  :length => 255, :required => true
  property :video_webm_uri, String, :length => 255, :required => true
  property :video_ogg_uri, String,  :length => 255, :required => true

end

# episode = Episode.new
# episode.title = "Active Record 3"
# episode.description = "The new Active Record query methods in Rails 3 might seem like magic at first. But in this episode I unravel how it works by browsing the Rails 3 source code."
# episode.video_mp4_uri = "http://video-js.zencoder.com/oceans-clip.mp4"
# episode.video_ogg_uri = "http://video-js.zencoder.com/oceans-clip.ogg"
# episode.video_webm_uri = "http://video-js.zencoder.com/oceans-clip.webm"
# episode.duration = "2:40"
# episode.save