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

  describe '#admin?' do
    it 'should return true if user is admin' do
      User.new(:admin => true).admin?.should be_true
    end
    it 'should return false if user is not admin' do
      User.new(:admin => false).admin?.should be_false
    end
  end
end