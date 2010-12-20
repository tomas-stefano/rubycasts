require 'spec_helper'

describe Episode do
  let(:episode) { Episode.new }
  
  context 'on validations' do
    before { episode.valid? }
    
    it 'title should be required' do
      episode.errors.on(:title).should_not be_nil
    end
    
    it 'description should be required' do
      episode.errors.on(:description).should_not be_nil
    end
    
    it 'video uri should be required' do
      episode.errors.on(:video_uri).should_not be_nil
    end
    
    it 'duration should be required' do
      episode.errors.on(:duration).should_not be_nil
    end
  end
  
end