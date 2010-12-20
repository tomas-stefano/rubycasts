class Episode
  include DataMapper::Resource

  property :id, Serial
  property :title, String,     :required => true
  property :description, Text, :required => true
  property :video_uri, String, :required => true
  property :duration, String,  :required => true

end
