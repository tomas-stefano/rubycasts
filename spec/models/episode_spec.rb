require 'spec_helper'

describe Episode do
  let(:episode) { Episode.new }
  
  context 'on validations' do
    
    before { episode.valid? }
    
    it "should validates the presence of link" do
      episode.errors.on(:link).should == ["Link must not be blank"]
    end
    
    it "should validates the presence of email" do
      episode.errors.on(:email).should == ["Email must not be blank"]
    end
    
  end
  
end