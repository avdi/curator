begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'environment'))
require 'curator'
