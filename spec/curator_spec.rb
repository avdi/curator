require File.dirname(__FILE__) + '/spec_helper.rb'

describe Curator do
  describe "given an ID and an event machine" do
    before :each do
      @id = :my_curator
      @em = stub("Event Machine")
      @it = Curator.new(@id, @em)
    end

    it "should only have one instance for a given id/em" do
      @new_curator = Curator.new(@id, @em)
      @new_curator.should equal(@it)
    end

    it "should have no collections" do
      @it.should have(0).collections
    end
    describe "with a new collection added" do
      before :each do
        @it.add_collection("Ming Vases", :filesystem, "file:///home/avdi/vases")
      end

      specify { @it.should have(1).collections }

      it "should store collection metadata" do
        collection = @it.collections.first
        collection.name.should == "Ming Vases"
        collection.type.should == :filesystem
        collection.uri.should == "file:///home/avdi/vases"
      end
    end

  end
end
