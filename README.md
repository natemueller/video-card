# Actually Not A Bad Video Card

This uses the same general approach as Ben Eater's ["world's worst
video card"](https://eater.net/vga), but with a few improvements:

  * Reduced chip count (22 => 14) and simplified wiring.  The hsync
    and vsync logic each fit comfortably on a single breadboard, as
    opposed to two in Ben's origin design.
  * 400x300 resolution.  A 6502 can't drive this at native resolution,
    but you could use it to build a serial terminal.
  * 8-bit color
  * No black vertical lines.  These were artifacts of slow EEPROM
    setup time.

There are a few ways you could optimize this further, but the ones
I've found would require sharing ICs between the hsync and vsync
logic.  This design is optimized for simple wiring on breadboards vs
saving a couple bucks on chips.

## 8-bit Color

8x8x4 color uses three bits for red, three for green and two for blue.
The values for the resistor ladder don't appear to match Ben's math,
but that's because you need to account for the internal 120Ω
resistance of the 74LS273.

## Creating and uploading images

I wrote my own image converter because I wanted to learn about
dithering algorithms and because I'm too lazy to figure out how to use
Gimp.  This script takes an input image, resizes and crops it to
400x300, and subsamples the color to the 8x8x4 color spaced used by
the video card.  It outputs a `.bin` file you can program onto an
EEPROM and a `.subsampled.png` version that you can look at for
debugging.

```bash
docker build -t video-card-converter .
docker run --rm -v $PWD:/6502 -w /6502 video-card-converter ruby convert.rb finch.jpg
minipro -p AT28C256 -w finch.jpg.bin
```
