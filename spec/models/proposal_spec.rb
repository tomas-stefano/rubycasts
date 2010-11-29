require 'spec_helper'

describe Proposal do
  
  context 'on validations' do
    let(:proposal) { Proposal.new }
    
    before do
      proposal.valid?
    end
    
    it "should save a new proposta" do
      proposta = Proposal.new(:name => "someone", :email => "contato@rubycasts.com", :url => "http://www.rubycasts.com.br", :description => "testing", :sugest => "awesome")
      proposta.should be_valid
    end
    
    it "should require a name" do
      proposal.errors.on(:name).should_not be_nil
    end
    
    it "should require a email" do
      proposal.errors.on(:name).should_not be_nil
    end
    
    it "should require a url" do
      proposal.errors.on(:url).should_not be_nil
    end
    
    it "should require a description" do
      proposal.errors.on(:description).should_not be_nil
    end
  end

end
