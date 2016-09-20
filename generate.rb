require './app/image_generator'

image = ImageGenerator.new(:template => 'left', :font_family => 'Arial', :text => 'My text')
output = image.convert()
output.write('output/test.png')