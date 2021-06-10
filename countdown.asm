// Minute Timer
// By Troy Fletcher
//
// Count down minutes (address register) and seconds
// (data register) Set minutes to count down at ram
// location 4 (default is 15), on expiration, LEDs
// will flash.

// Constants
%define statusRegister      252
%define minutes             254
%define seconds             255

00100100 00000010 11111100   bset 2 statusRegister
00000101 00001111 11111110   copylr 15 minutes
00000101 00111100 11111111   copylr 60 seconds
00000010 11110000            speed 0xF0
                             :loop
00011111 11111111            decrjz seconds
00101000 00001011            jump loop
00000101 00111011 11111111   copylr 59 seconds
00011111 11111110            decrjz minutes
00101000 00001011            jump loop
                             :flash
00000010 00000000            speed 0x00
00000101 11111111 11111110   copylr 0xFF minutes
00000101 00000000 11111111   copylr 0x00 seconds
00010000 11111110 11111111   swaprr minutes seconds
00000010 10000000            speed 0x80
00101000 00011110            jump flash

// plans to add input to turn display on/off
// so it's less distracting, but you can still
// check the time while it's counting down
