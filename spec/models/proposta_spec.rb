require 'spec_helper'

describe Proposta do

  it "should save a new proposta" do
    proposta = Proposta.new(:name => "someone", :email => "contato@rubycasts.com", :url => "http://www.rubycasts.com.br", :description => "testing", :sugest => "awesome")
    proposta.should be_valid
    proposta.save.should == true
  end
  
  it "should valid a new proposta with all parameters" do
    proposta = Proposta.new(:name => "someone", :email => "contato@rubycasts.com", :url => "http://www.rubycasts.com.br", :description => "testing", :sugest => "awesome")
    proposta.should be_valid
  end

  it "should require a name" do
    proposta = Proposta.new(:email => "contato@rubycasts.com.br", :url => "http://www.rubycasts.com.br", :description => "testing", :sugest => "awesome")
    proposta.should_not be_valid
  end

  it "should require a email" do
    proposta = Proposta.new(:name => "someone", :url => "http://www.rubycasts.com.br", :description => "testing", :sugest => "awesome")
    proposta.should_not be_valid 
  end
 
  it "should require a url" do
    proposta = Proposta.new(:name => "someone", :email => "contato@rubycasts.com.br", :description => "testing", :sugest => "awesome")
    proposta.should_not be_valid 
  end
 
  it "should require a description" do
    proposta = Proposta.new(:name => "someone", :email => "contato@rubycasts.com.br", :url => "http://www.rubycasts.com.br", :sugest => "awesome")
    proposta.should_not be_valid 
  end

end
