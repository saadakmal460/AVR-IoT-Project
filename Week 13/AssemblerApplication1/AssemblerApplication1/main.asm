.include "m328pdef.inc"
.cseg
.org 0x00
LDI r16, (1<<PINB5) ; load 00100000 into register R16
OUT DDRB, r16 ; write register R16 value to DDRB register
LDI r17, (1<<PINB5) ; load 00100000 into register R16
OUT PORTB, r17 ; write register R16 value to PORTB register
loop:
rjmp loop ; stay in infinite loop