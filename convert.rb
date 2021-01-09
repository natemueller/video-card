require 'rmagick'

WIDTH = 100
HEIGHT = 75
ROM_SIZE = 32*1024

row_size = 2**(Math.log(WIDTH)/Math.log(2)).ceil

image = Magick::Image.read(ARGV[0]).first
image = image.resize_to_fill(WIDTH, HEIGHT)

out = File.open(ARGV[0] + '.bin', 'w')

HEIGHT.times do |y|
  WIDTH.times do |x|
    pixel = image.pixel_color(x, y)

    red = ((pixel.red * 7)/65536.0).round
    green = ((pixel.green * 7)/65536.0).round
    blue = ((pixel.blue * 3)/65536.0).round

    subsampled = (red << 5) + (green << 2) + blue
    out.write([subsampled].pack('C'))
  end

  out.write("\0" * (row_size - WIDTH))
end

out.write("\0" * (ROM_SIZE - row_size*HEIGHT))
