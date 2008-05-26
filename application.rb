require 'pathname'
ROOT = Pathname.new(__FILE__).dirname
Pathname.glob(ROOT + 'vendor' + '*' + 'lib').each do |path|
  $LOAD_PATH.unshift(path.to_s)
end

require 'rubygems'
require 'sinatra'
require 'builder'
require 'markaby'

helpers do
  def name
    "Curator"
  end
end

template :layout do
<<-END
    div do
      div "Above"
      self << yield
      div "Below"
    end
END
end

get '/' do
  mab do
    div.foo! "Welcome to  #{name}"
  end
end
