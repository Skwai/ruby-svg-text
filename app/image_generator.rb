require 'RMagick'
require 'erb'
require 'ostruct'

class ImageGenerator

  def initialize(args = {})
    @args = args
    @template = args.values_at(:template).first
    @svg = get_svg()
  end

  def get_svg()
    file = File.open("./templates/#{@template}.svg.erb").read
    svg = ERB.new(file).result(OpenStruct.new(@args).instance_eval { binding })
    puts svg
    svg
  end

  def convert()
    img = Magick::Image.from_blob(@svg) {
      self.format = 'SVG'
      self.background_color = 'transparent'
    }
    img.first
  end
end