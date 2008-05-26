# -*- mode: ruby -*-
require File.join(File.dirname(__FILE__), '..', 'lib', 'environment')

require 'sinatra'

Sinatra::Application.default_options.merge!(:run => false,
                                            :env => :production
                                            )
require 'curator'
require 'application'
require 'curator/middleware/event_machine'
require 'curator/middleware/curator_finder'
require 'socket'

use Curator::Middleware::EventMachine
use Curator::Middleware::CuratorFinder, Socket.gethostname
run Sinatra.application
