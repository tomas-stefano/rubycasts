class Comment
  include DataMapper::Resource
  belongs_to :episode
  
  property :id, Serial
  property :author, String, :length => 50, :required => true
  property :body, String, :length => 255, :required => true
  property :episode_id, Integer, :required => true
end
