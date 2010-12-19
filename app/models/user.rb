class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
  property :password, String
  
  # Authenticate User
  #
  def self.authenticate!(params)
    User.new
  end
  
end