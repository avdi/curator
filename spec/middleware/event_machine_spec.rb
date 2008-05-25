require File.dirname(__FILE__) + '/../spec_helper.rb'
require 'curator/middleware/event_machine'

module EventMachine
end

describe Curator::Middleware::EventMachine do
  before :each do
    @app = stub("App")
    @it  = Curator::Middleware::EventMachine.new(@app)
    @env = {}
  end

  it "should set the 'curator.event_machine' env variable" do
    @app.should_receive(:call).with({'curator.event_machine' => EventMachine})
    @it.call(@env)
  end
end
