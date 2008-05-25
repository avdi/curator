require 'curator'

module Curator::Middleware
  class CuratorFinder
    def initialize(app, id)
      @app = app
      @id  = id
    end

    def call(env)
      em = env.delete("curator.event_machine") do
        raise ArgumentError, "The key curator.event_machine MUST be supplied"
      end
      curator = ::Curator.new(@id, em)
      env['curator.curator'] = curator
      @app.call(env)
    end
  end
end
