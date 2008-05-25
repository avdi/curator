module Curator::Middleware
  class EventMachine
    def initialize(app)
      @application = app
    end

    def call(env)
      env['curator.event_machine'] = ::EventMachine
      @application.call(env)
    end
  end
end
