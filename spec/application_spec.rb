require 'spec_helper'

describe Sinatra::Application do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  describe 'test routes' do
    it "should respond to /" do
      get '/'
      last_response.should be_ok
    end

    it "should return 404 status" do
      get '/404'
      last_response.status.should == 404
    end

    it "should return about page" do
      get '/about'
      last_response.should be_ok
    end

    it "should return login page" do
      get '/login'
      last_response.should be_ok
    end

    it "should return signup page" do
      get '/signup'
      last_response.should be_ok
    end

    it "should return logout page" do
      pending
      get '/logout'
      last_response.should be_ok
    end

    it "should return users page" do
      pending
      get '/users'
      last_response.should be_ok
    end
    
    it "should return upload page" do
      get '/admin/upload'
      last_response.should be_ok
    end

  end
end
