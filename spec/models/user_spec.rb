require 'spec_helper'

describe User do
  describe '#authenticate' do
    before do
      @user = User.create(:email => 'batman@arkham.com', :password => 'Joker')
    end
    
    context 'failed attempts' do
      # This matchers are equal to false to ensure that returns false instead of nil
      
      it 'should return false when not match email' do
        User.authenticate!({:email => 'batman@owned_joker.com', :password => 'Joker'}).should equal false
      end
      
      it 'should return false when not match the password' do
        User.authenticate!({:email => 'batman@arkham.com', :password => 'Harlequina'}).should equal false
      end
    end
    context 'successful attempts' do
      
      it 'should return the user is the database when have the email and password' do
        User.authenticate!({:email => 'batman@arkham.com', :password => 'Joker'}).should == @user
      end
    end
  end
end