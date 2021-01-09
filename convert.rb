require 'rmagick'

WIDTH = 100
HEIGHT = 75
ROM_SIZE = 32*1024

module Magick
  class Pixel
    def to_a
      return [self.red, self.green, self.blue]
    end
  end
end

row_size = 2**(Math.log(WIDTH)/Math.log(2)).ceil

image = Magick::Image.read(ARGV[0]).first
image = image.resize_to_fill(WIDTH, HEIGHT)

out = File.open(ARGV[0] + '.bin', 'w')

HEIGHT.times do |y|
  WIDTH.times do |x|
    pixel = image.pixel_color(x, y)

    subsampled = pixel.to_a
                   .zip([7, 7, 3])
                   .map {|p, s| (p*s/Magick::QuantumRange.to_f).round }
    error = subsampled
              .zip([7, 7, 3], pixel.to_a)
              .map {|p, s, o| (p*Magick::QuantumRange/s.to_f).round - o }

    [
      [1, 0, 7/16.0],
      [-1, 1, 3/16.0],
      [0, 1, 5/16.0],
      [1, 1, 1/16.0],
    ].each do |dx, dy, diffusion|
      dst_pixel = image.pixel_color(x+dx, y+dy).to_a
                    .zip(error)
                    .map {|p, e| p + e*diffusion }
                    .map {|p| [0, [Magick::QuantumRange, p].min].max }
      image.pixel_color(x+dx, y+dy, Magick::Pixel.new(*dst_pixel))
    end

    subsampled_pixel = subsampled
                         .zip([7, 7, 3])
                         .map {|p, s| (p*Magick::QuantumRange/s.to_f).round }
                         .map {|p| [0, [Magick::QuantumRange, p].min].max }
    image.pixel_color(x, y, Magick::Pixel.new(*subsampled_pixel))

    out.write([(subsampled[0] << 5) + (subsampled[1] << 2) + subsampled[2]].pack('C'))
  end

  out.write("\0" * (row_size - WIDTH))
end

out.write("\0" * (ROM_SIZE - row_size*HEIGHT))

image.write(ARGV[0] + '.subsampled.png')
