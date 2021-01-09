# Optimized Ben Eater VGA Card

This uses the same general approach as Ben but optimizes the logic.
The hsync and vsync circuits only need 13 chips instead of 20.  The
whole design fits comfortably on three breadboards with much easier
wiring.

I also increased the color depth from 6-bit to 8-bit.  Uses 8x8x4
color for better rendering with no additional memory use.

There are a few ways you could optimize this further, but they would
require sharing ICs between the hsync and vsync logic.  That's good
for a production run on PCBs, but it would make a breadboard
implementation super messy for no real gain.

## Horizontal Sync

* Exit visible area: 0 1100 1000 (200)
* Start of hsync:    0 1101 0010 (210)
* End of hsync:      0 1111 0010 (242)
* End of line:       1 0000 1000 (264)

exit visible => end of line:
  * set: B3 ⊼ B6 ⊼ B7
  * reset: B3 ⊼ B8
  * 2x quad nand, and nand latch

start of hsync => end of hsync:
  * set: invisible ⊼ !reset ⊼ B1 ⊼ B4
  * reset: B1 ⊼ B4 ⊼ B5
  * 2x quad nand, and nand latch

## Vertical Sync

* Exit visible area: 10 0101 1000 (600)
* Start of vsync:    10 0101 1001 (601)
* End of vsync:      10 0101 1101 (605)
* End of frame:      10 0111 0100 (628)

exit visible => end of frame:
  * set: (B4 ∧ B6 ∧ B9) ⊼ B3
  * reset: (B4 ∧ B6 ∧ B9) ⊼ B3 ⊼ B5
  * 2x quad nand, 1x quad and, and nand latch

start of vsync => end of vsync
  * set: (B4 ∧ B6 ∧ B9) ⊼ !reset ⊼ B0 ⊼ B3
  * reset: (B4 ∧ B6 ∧ B9) ⊼ !reset ⊼ B0 ⊼ B2 ⊼ B3
  * 2x quad nand, and nand latch

## 8-bit Color

8x8x4 color uses three bits for red, three for green and two for blue.
The resistor ladder for blue is unchanged -- 1.5kΩ and 680Ω.  For the
other two colors, 3.3kΩ, 1.6kΩ and 820Ω.

While 1.6kΩ is in the E24 series, most resistor kits don't have it.
Replacing it with 1.5kΩ results in an out of spec signal, but my
monitor handles it fine.  YMMV.

## Creating and uploading images

```bash
docker build -t video-card-converter .
docker run --rm -v $PWD:/6502 -w /6502 video-card-converter ruby convert.rb finch.jpg
minipro -p AT28C256 -w finch.jpg.bin
```
