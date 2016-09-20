require 'RMagick'
require 'erb'
require 'ostruct'

class ImageGenerator

  def initialize(args = {})
    @font_family = args.fetch(:font_family, 'Arial')
    @font_color = args.fetch(:font_color, '#000')
    @font_weight = args.fetch(:font_weight, 400)
    @letter_spacing = args.fetch(:letter_spacing, 1)
    @text = args.fetch(:text, 1)
    @template = args.fetch(:template, 'left')
  end

  def get_svg()
    file = File.open("./templates/#{@template}.svg.erb").read
    svg = ERB.new(file).result(OpenStruct.new(self).instance_eval { binding })
  end

  def convert()
    img = Magick::Image.from_blob(@svg) {
      self.format = 'SVG'
      self.background_color = 'transparent'
    }
    img.first
  end
end