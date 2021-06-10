# Digirule Countdown Timer

The Digirule 2u is a 70's-style personal computer for fun and education. It runs a PIC18 off a coin cell battery with 8 buttons of input, and 16 LEDs of output. Supports 50 instructions and programs manually in binary into 252 bytes of memory, and has an onboard USB serial interface.

The digirule is a mostly useless device, and your cell phone is millions of times more powerful, but neither Eric Schmidt, nor Bill Gates can spy on it, and the Commodore 64 music video slaps. Don't @ me.

The Digirule project may be found here: https://bradsprojects.com/digirule2/

This project is a countdown timer which counts down 15 minutes in binary, with a display of remaining minutes and seconds, then flashes the LEDS to let you know time has expired.

Change the minutes from 15 by changing the byte value in memory location 4

## Future versions
1. Add blackout mode to hide the countdown so it's not so distracting while it counts down in binary. Workaround for this now is to just change the minutes and seconds memory locations to something without LED output.
2. After blackout mode, make a button so you can peek at the time real quick without impacting the countdown timer
3. Add zork

## Bugs/Unexpected features
1. The minute count indicates what minute is counting down, so 15:30 is actually 14 minute and 30 seconds remaining. This means that if you want to count down 30 seconds, you must set the minute timer to 1. It is possible to change this behavior, but it is not convenient.
