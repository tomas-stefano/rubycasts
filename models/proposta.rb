class Proposta
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :email, String
  property :url, String
  property :description, Text
  property :sugest, Text
  
  attr_accessor :id, :name, :email, :url, :description

  validates_presence_of :url, :email, :name, :description
end
