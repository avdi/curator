require 'pathname'
ROOT = Pathname.new(__FILE__).dirname
Pathname.glob(ROOT + 'vendor' + '*' + 'lib').each do |path|
  $LOAD_PATH.unshift(path.to_s)
end

require 'rubygems'
require 'sinatra'
require 'builder'
require 'markaby'

module MarkabyRenderer
  def mab(content=nil, options={}, &block)
    content = Proc.new { block } if content.nil?
    render(:mab, content, options)
  end

  def render_mab(content, options ={}, &block)
    output = Markaby::Builder.new(options.fetch(:locals){{}},
                                  options.fetch(:scope){self})
    output.tagset = Markaby::XHTMLStrict
    case content
    when String then output.instance_eval(content)
    when Proc then output.capture(&content)
    else raise NotImplementedError
    end
  end
end
class Sinatra::EventContext
  include MarkabyRenderer
end

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
