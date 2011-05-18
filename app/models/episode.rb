class Episode
  include DataMapper::Resource

  property :id, Serial
  property :title, String,     :length => 255, :required => true
  property :description, Text, :length => 255, :required => true
  property :duration, String,  :required => true
  property :code, String, :required => true, :length => 255
  
  # URI for video encoding
  property :video_mp4_uri, String,  :length => 255, :required => true
  property :video_webm_uri, String, :length => 255, :required => true
  property :video_ogg_uri, String,  :length => 255, :required => true

  has n, :comments

  def self.first_five_in_desc_order
    first(5, :order => :id.desc)
  end

end
