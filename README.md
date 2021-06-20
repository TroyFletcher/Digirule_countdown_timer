# Digirule Countdown Timer

The Digirule 2u is a 70's-style personal computer for fun and education. It runs a PIC18 off a coin cell battery with 8 buttons of input, and 16 LEDs of output. Supports 50 instructions and programs manually in binary into 252 bytes of memory, and has an onboard USB serial interface.

The digirule is a mostly useless device, and your cell phone is millions of times more powerful, but neither Eric Schmidt, nor Bill Gates can spy on it, and the Commodore 64 music video slaps. Don't @ me.

The Digirule project may be found here: https://bradsprojects.com/digirule2/

### countdown.asm

* countdown timer
* displays the remaining time
* flashes when time is up

This project is a countdown timer which counts down 15 minutes in binary, with a display of remaining minutes and seconds, then flashes the LEDS to let you know time has expired.

Change the minutes from 15 by changing the byte value at the 4th memory location.

### digiruletimertest.asm

* Still a countdown timer!
* displays one blinking LED instead of the time
* or it can display the time too, I'm not the boss of you
* still flashes when time is up!

digiruletimertest is a file in an assembler-friendly format. The file includes the countdown timer with toggle-able time display at memory position 0x06, a "look busy" feature at memory position 0x64 and a kill the bit game at 0x71. It will fill the memory starting at the 6th memory position, so you can put a table of contents with those memory addresses in the first few bytes of the memory slot so you can easily jump to which ever program with the GOTO button when you load the programs.

Like countdown.asm, Digiruletimertest stores the minutes in the 4th memory space (after you jump to 0x06). Upon execution, the digirule will not flash the lights to display the remaining time, rather it will only display one politely blinking LED. To switch displaying this single LED or the complete display of remaining time, simply hold any of the buttons for one second.

Now you can hide the countdown display if it's too distracting!

## Future versions
1. **DONE!** Add blackout mode to hide the countdown so it's not so distracting while it counts down in binary. Workaround for this now is to just change the minutes and seconds memory locations to something without LED output.
2. **DONE!** After blackout mode, make a button so you can peek at the time real quick without impacting the countdown timer
3. Add zork
4. Get some PWM so the digirule can make angry noises at you, or play the notes for "Are you keeping up with the Digirule?"

## Bugs/Unexpected features
1. The minute count indicates what minute is counting down, so 15:30 is actually 14 minute and 30 seconds remaining. This means that if you want to count down 30 seconds, you must set the minute timer to 1. It is possible to change this behavior, but it is not convenient.
