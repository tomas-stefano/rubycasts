require File.expand_path(File.dirname(__FILE__) + '/spec_helper' )

describe	"social bar" do
	it "should ok" do
		social_bar({:s=>"A"}).should == "sa"
	end
end
