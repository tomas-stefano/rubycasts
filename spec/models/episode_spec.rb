require 'spec_helper'

describe Episode do
  let(:episode) { Episode.new }

  describe '.first_five_in_desc_order' do
    let(:create_five_episodes) { 5.times { create_episode } }
    it 'should return five episodes' do
      create_five_episodes
      Episode.first_five_in_desc_order.should have(5).items
    end
    
    it 'should return the last creates video in first item' do
      create_five_episodes
      last_episode = create_episode(:title => 'Last Episode')
      Episode.first_five_in_desc_order.first.title.should == 'Last Episode'
    end
  end
  
  context 'on validations' do
    before { episode.valid? }
    
    it 'title should be required' do
      episode.errors.on(:title).should_not be_nil
    end
    
    it 'description should be required' do
      episode.errors.on(:description).should_not be_nil
    end
    
    it 'video uri should be required' do
      episode.errors.on(:video_ogg_uri).should_not be_nil
    end

    it 'video uri should be required' do
      episode.errors.on(:video_mp4_uri).should_not be_nil
    end

    it 'video uri should be required' do
      episode.errors.on(:video_webm_uri).should_not be_nil
    end
    
    it 'duration should be required' do
      episode.errors.on(:duration).should_not be_nil
    end
    
  end
  
  def create_episode(options={})
    Episode.create({
      :title => 'RubyCasts Intro',
      :description => 'Intro how to do a Sinatra app',
      :code => 'def rubycasts\n end',
      :duration => '5:50',
      :video_mp4_uri  => 'http',
      :video_webm_uri => 'http',
      :video_ogg_uri  => 'http'
    }.merge(options))
  end
  
end