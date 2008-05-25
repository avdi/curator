require File.dirname(__FILE__) + '/../spec_helper.rb'
require 'curator/middleware/curator_finder'

describe Curator::Middleware::CuratorFinder do
  before :each do
    @app = stub("App", :call => nil)
    @id  = :foo
    @em  = stub("EventMachine")
    @it  = Curator::Middleware::CuratorFinder.new(@app, :foo)
    @env = {'curator.event_machine' => @em}
    @curator = stub("Curator instance")
    ::Curator.stub!(:new).and_return(@curator)
  end

  it "should set the 'curator.curator' env variable" do
    @app.should_receive(:call).with({'curator.curator' => @curator})
    @it.call(@env)
  end

  it "should call Curator.new with event machine and instance ID" do
    ::Curator.should_receive(:new).with(@id, @em).and_return(@curator)
    @it.call(@env)
  end

end
