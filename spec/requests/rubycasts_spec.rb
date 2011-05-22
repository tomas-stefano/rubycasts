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
    
    it 'should get only the six first episodes' do
      Episode.should_receive(:first_five_in_desc_order).and_return([])
      get '/'
      last_response.status.should == 200
    end

    it "should return 404 status" do
      get '/404'
      last_response.status.should == 404
    end

    it "should return about page" do
      get '/about'
      last_response.should be_ok
    end
    
    it 'should be redirect when not logged in' do
      get 'episodes/new'
      last_response.status.should == 302
    end
    
    it 'should be redirect to root when not loggen in' do
      post 'episodes/create', {:title => 'Lets go!'}
      last_response.status.should == 302
    end
    
    it 'should be redirect when not have some episode' do
      get 'episodes/12'
      last_response.status.should == 302
    end
    
    it 'should not redirect when have an episode' do
      Episode.should_receive(:get).and_return(Episode.new)
      get 'episodes/6'
      last_response.status.should == 200
    end
    
    describe '/comments/post' do
      context 'when valid params' do
        before do
          user = mock(:user, :comments => Comment)
          should_receive(:current_user).and_return(user)
          post 'comments/create', {:body => 'Hey ow! Lets go!', :author => "You my friend!", :episode_id => 1}
          @comment = Comment.first
        end
        
        it 'should create a comment' do
          @comment.body.should == 'Hey ow! Lets go!'
        end 

        it { @comment.user_id.should == 2 }
        it { @comment.episode_id.should == 1}
      end
    end
  end
end
