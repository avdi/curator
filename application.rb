require 'rubygems'
require 'sinatra'
require 'builder'
require 'markaby'

# Monkeypatch Markaby so as not to collide with XML::Builder renderer
class Markaby::Builder
  def capture(&block)
    @streams.push(@builder.target = [])
    @builder.level += 1
    str = instance_eval(&block)
    str = @streams.last.join if @streams.last.any?
    @streams.pop
    @builder.level -= 1
    @builder.target = @streams.last
    str
  end
end

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
