require 'RMagick'
require 'erb'
require 'ostruct'

def erb(template, vars)
  ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
end

template = File.open('./templates/left.svg.erb').read
svg = erb(template, :font_family => '#000', :text => 'My text')

img = Magick::Image.from_blob(svg) {
  self.format = 'SVG'
  self.background_color = 'transparent'
}

img[0].write('example.png')