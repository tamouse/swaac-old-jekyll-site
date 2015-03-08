module Link
  def link_to(text, url)
    "<a href=\"#{url}\">#{text}</a>"
  end
  def link_to_homesite(text, path = '')
    link_to text, 'http://brighterplanet.com/' + path
  end
end

class Header
  include Link
  
  def link_to(text, url)
    if text == 'Developer site'
      text
    else
      super
    end
  end
  
  def render(*args)
    "{% include title.html %}"
  end
  def flash
    {}
  end
  
  def get_binding
    binding
  end
end

class Footer
  include Link

  def render(*args); end

  def get_binding
    binding
  end
end

class GoogleAnalytics
  def javascript_tag(&blk)
    @output << '<script type="text/javascript">'
    yield
    @output << '</script>'
  end
  
  def get_binding
    binding
  end
end

class BrighterPlanetLayout
  def self.application; self end
  def self.application_name; 'Brighter Planet developer site' end
  def self.google_analytics_ua_number; 'UA-1667526-20' end
end

class BrighterPlanet
  def self.layout() BrighterPlanetLayout end
end

class Layout
  def stylesheet_link_tag(*sheets)
    sheets.collect do |sheet|
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/#{sheet}.css\" />"
    end
  end
  
  def javascript_include_tag(*args); end
  
  def csrf_meta_tag; end
  def render_or_nothing(*args); end
    
  def render(options = {})
    "{% include #{options[:partial][/[a-z_]*$/]}.html %}"
  end
  
  def get_binding
    binding
  end
end

class String
  def html_safe
    self
  end
end

class Rails
  module VERSION
    MAJOR = nil
  end
  class << self
    def env
      self
    end
    def production?
      true
    end
  end
end
