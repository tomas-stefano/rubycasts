require 'spec_helper'

describe Comment do
  let(:comment) { Comment.new }

  context "on validations" do
    before { comment.valid? }

    it "should require a author" do
      comment.errors.on(:author).should_not be_nil      
    end

    it "should require a body" do
      comment.errors.on(:body).should_not be_nil
    end

    it "should require a episode id" do
      comment.errors.on(:episode_id).should_not be_nil
    end
  end

end
