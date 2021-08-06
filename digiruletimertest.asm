idle                equ 249
seconds             equ 250
minutes             equ 251
statusRegister      equ 252
buttonRegister      equ 253
addressLEDRegister  equ 254
dataLEDRegister     equ 255

	      org 0                                       
	      byte countdown   ; make table of contents for jumps
	      byte lookbusy
	      byte ants
	      byte echo
	      byte 0           ; padding so you dont 'next' to far
	      byte 0
countdown     speed 0
	      copylr 15,minutes
	      copylr 60,seconds
              bset 2,statusRegister
	      copylr 0,idle
	      bset 7,statusRegister
loop          jump checkbutton
reducetime    speed 0xBF
	      decrjz seconds
	      jump loop
	      copylr 60,seconds
	      decrjz minutes
	      jump loop
	      jump flash
checkbutton   speed 0
	      copyra buttonRegister
	      xorla 0
	      btstss 0,statusRegister
	      jump buttonpushed
	      nop
	      nop
drawstart     btstss 7,statusRegister
	      jump draw
	      jump blank
buttonpushed  bchg 7,statusRegister
	      jump drawstart
draw          nop
	      copyrr minutes,addressLEDRegister
	      copyrr seconds,dataLEDRegister
	      jump reducetime
blank         copylr 0,dataLEDRegister
	      bchg 7,idle
	      copyrr idle,addressLEDRegister
	      jump reducetime
flash         speed 0x00
	      copylr 0xFF,addressLEDRegister
	      copylr 0x00,dataLEDRegister
	      copyla 0x07     ; Copy terminal bell to accumulator
	      speed 0x80      ; 500 ms
flashrpt      swaprr addressLEDRegister,dataLEDRegister
              comout          ; scream bells into the tty
	      jump flashrpt
lookbusy      speed 0x80      ; 500 ms
              bset 2,statusRegister
lookbusyloop  randa
              copyar dataLEDRegister
              randa
              copyar addressLEDRegister
              jump lookbusyloop
ants          speed 32
              copylr 1,dataLEDRegister
antsloop      shiftrl dataLEDRegister
              copyra buttonRegister
              xorra dataLEDRegister
              copyar dataLEDRegister
              jump antsloop 
echo          speed 0
              bset 2,statusRegister
              copylr 0,addressLEDRegister
              copylr 0,dataLEDRegister
echoloop      speed 0
              comin
              copyar dataLEDRegister
              comin
              copyar addressLEDRegister
              jump echoloop
              end
