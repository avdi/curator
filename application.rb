require 'rubygems'
require 'sinatra'
require 'markaby'

module MarkabyRenderer
  def mab(options = {}, &template)
    render(:mab, template, options)
  end

  def render_mab(template)
    Markaby::Template.new(template).render({}, self).to_s
  end
end
Sinatra::EventContext.send :include, MarkabyRenderer


get '/' do
  mab do
    h1 "Welcome to Curator!"
  end
end
