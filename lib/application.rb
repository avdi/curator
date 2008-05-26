require File.join(File.dirname(__FILE__), 'environment')
require 'rubygems'
require 'sinatra'

helpers do
  def curator
    request.env['curator.curator']
  end
end

template :layout do
<<-END
  xhtml_strict do
    head do
      title "Curator"
    end
    body do
      self << yield
    end
  end
END
end

get '/' do
  mab do
    div.foo! "Welcome!  #{curator.inspect}"
  end
end
