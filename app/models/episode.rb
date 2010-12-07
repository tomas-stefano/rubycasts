class Episode
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :url, String
  property :description, Text

  attr_accessor :id, :name, :email, :url, :description

  validates_presence_of :link
  validates_presence_of :email

end
