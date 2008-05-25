$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'facets/multiton'

class Curator
  include Multiton
  def initialize(id, em)

  end
end
