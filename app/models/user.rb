class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, String
  property :encrypted_password, String, :length => 255
  
  # Get the encrypted_password for the User
  #
  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end
  
  # Encrypt the password before put in the Database
  #
  def password=(super_secret)
    @password = BCrypt::Password.create(super_secret)
    self.encrypted_password = @password
  end
  
  # Authenticate User
  #
  def self.authenticate!(params)
    user = User.first(:email => params[:email])
    if user
      user.check_the_password!(params[:password])
    else
      false
    end
  end
  
  # Check if the user password is equal to the secret_password
  #
  def check_the_password!(secret_password)
    return self if password == secret_password
    false
  end
  
end
