class Comment
  include DataMapper::Resource
  belongs_to :episode
  belongs_to :user
  
  property :id, Serial
  property :body, String, :length => 255, :required => true
  property :episode_id, Integer, :required => true
  property :user_id, Integer, :required => true
end
