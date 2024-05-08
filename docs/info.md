<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Races the beam! Font is pre generated and loaded into registers. 6 bit colour keeps register count low.

## How to test

Hook up a VGA monitor to the outputs and provide a clock at 31.5 MHz. Connect the 6 bit colour output up with resistors to make
a R2R DAC. See the circuit here: https://github.com/mattvenn/6bit-pmod-vga

## External hardware

R2R DAC - you can use one of these VGA PMODs:

* https://github.com/mole99/tiny-vga
* https://github.com/TinyTapeout/tt-vga-clock-pmod

Set input[3] low to use tiny-vga and high to use vga-clock
