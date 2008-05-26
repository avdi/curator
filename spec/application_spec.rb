require File.dirname(__FILE__) + '/spec_helper.rb'
require 'sinatra'
require 'sinatra/test/spec'
require 'application'

describe "curator application" do
  describe "GET /" do
    before :each do
      get_it '/'
    end
    it "should support getting /" do
      @response.should be_ok
      body.should =~ /Welcome!/
    end
  end
end
