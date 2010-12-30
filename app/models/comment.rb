class Comment
  include DataMapper::Resource
  belongs_to :episode
  
  property :id, Serial
  property :body, String, :length => 255
  property :episode_id, Integer
end