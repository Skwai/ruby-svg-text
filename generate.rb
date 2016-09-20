require './app/image_generator'

image = ImageGenerator.new(
  :template => 'left',
  :font_color => '#222',
  :font_family => 'Arial',
  :font_weight => 400,
  :letter_spacing => 3,
  :text => 'My text'
)
output = image.convert()
output.write('output/test.png')