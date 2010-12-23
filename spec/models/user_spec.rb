require 'spec_helper'

describe User do
  describe '#admin?' do
    it 'should return true if user is admin' do
      User.new(:admin => true).admin?.should be_true
    end
    it 'should return false if user is not admin' do
      User.new(:admin => false).admin?.should be_false
    end
  end
  
  describe '.create_user_from_omni_auth!' do
    before do
      @omniauth = { 
        "provider" => "github", 
        "uid" => "my_precious_uid!123", 
        "user_info" => { "email" => "batman@arkham.com", "name" => "Batman", 
                        "nickname" => "Bats", "urls" => {"GitHub" => 'githubsite', "Blog" => "rubycasts.com.br" }},
        "extra" => {"user_hash" => {"gravatar_id" => "my_avatar"}}}
      @user = User.create_from_omniauth!(@omniauth)      
    end
    
    it 'should persist the email' do
      @user.email.should == "batman@arkham.com"
    end
    
    it 'should persist the github uid' do
      @user.github_uid.should == 'my_precious_uid!123'
    end
    
    it 'should persist the github username' do
      @user.github_user.should == "Bats"
    end
    
    it 'should persist the name' do
      @user.name.should == "Batman"
    end
    
    it 'should persist the gravatar token from github' do
      @user.gravatar_id.should == "my_avatar"
    end
    
    it 'should persist the site/blog off the User' do
      @user.site.should == 'rubycasts.com.br'
    end
    
    it 'should not be admin' do
      @user.admin?.should be_false
    end
    
  end
  
end