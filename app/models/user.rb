class User
  include DataMapper::Resource

  has n, :comments
  
  property :id, Serial
  property :email, String

  property :admin, Boolean
  property :github_uid, String, :length => 255
  property :github_user, String, :length => 255
  property :name, String, :length => 255
  property :gravatar_id, String, :length => 255
  property :site, String, :length => 255
  property :token, String, :length => 255

  before :save!, :generate_token!
  
  def self.create_from_omniauth!(omniauth_hash)
    User.new.tap do |user|
      user.email       = omniauth_hash['user_info']['email']
      user.github_uid  = omniauth_hash['uid']
      user.github_user = omniauth_hash['user_info']['nickname']
      user.name        = omniauth_hash['user_info']['name']
      user.gravatar_id = omniauth_hash['extra']['user_hash']['gravatar_id'] if (omniauth_hash["extra"] and omniauth_hash["extra"]["user_hash"])
      user.site        = omniauth_hash['user_info']['urls']['Blog'] if omniauth_hash['user_info']['urls']
      user.admin       = false
      user.save!
    end
  end
  
  DICT_WORDS = ('a'..'z').to_a + ('A'..'Z').to_a + ('1'..'9').to_a
  def generate_token!
    self.token = Array.new(60) { DICT_WORDS.sample }.join
  end
  
end
