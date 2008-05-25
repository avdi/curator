$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'facets/multiton'

class Curator
  include Multiton

  Collection = Struct.new(:name, :type, :uri)

  # The collections of artifacts this curator catalogs
  attr_reader :collections

  def initialize(id, em)
    @collections = []
  end

  def add_collection(name, type, uri)
    @collections << Collection.new(name, type, uri)
  end
end
