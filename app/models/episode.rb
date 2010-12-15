class Episode
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :video_uri, String
  property :duration, String

end
