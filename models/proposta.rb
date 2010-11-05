class Proposta
  include DataMapper::Resource
  
  property :id,           Serial
  property :name,         String, :required => true
  property :email,        String, :required => true
  property :url,          String, :required => true
  property :description,  Text,   :required => true
  property :sugest,       Text
  
end
