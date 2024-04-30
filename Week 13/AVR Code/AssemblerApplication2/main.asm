.include "m328pdef.inc"
.include "delay.inc"
.include "1602_LCD.inc"
.cseg
.org 0x00

; Setting pins to Output for LCD
sbi DDRD,PD0 ; D0 pin of LCD
sbi DDRD,PD1 ; D1
sbi DDRD,PD2 ; D2
sbi DDRD,PD3 ; D3
sbi DDRD,PD4 ; D4
sbi DDRD,PD5 ; D5
sbi DDRD,PD6 ; D6
sbi DDRD,PD7 ; D7
;Setting LCD Mode selection pins
sbi DDRB,PB0 ; RS
sbi DDRB,PB1 ; E pin of LCD
;Setting LCD Backlight pin
sbi DDRB,PB5 ; BLA pin of LCD
; LCD Init
LCD_send_a_command 0x01 ; sending all clear command
LCD_send_a_command 0x38 ; set LCD mode to 16*2 line LCD
LCD_send_a_command 0x0C ; screen ON
sbi PORTB,PB5

SBI DDRB, PB3    ; PB3 set as OUTPUT Pin
CBI PORTB, PB3   ; LED OFF

SBI DDRB, PB2    ; PB2 set as OUTPUT Pin
CBI PORTB, PB2   ; LED OFF

CBI DDRB, PB4    ; PB4 set as INPUT pin
SBI PORTB, PB4   ; Enable internal pull-up resistor

loop:
; check if push button is pressed
SBIS PINB, PB4   ; if not pressed, skip next line if the PINB reg. bit# 4 is 1
rjmp L1

; PB4 is pressed
CBI PORTB, PB3   ; LED OFF
SBI PORTB, PB2   ; LED ON
rjmp RED_ON_LCD
delay 100
rjmp loop

L1:
; PB4 is not pressed
SBI PORTB, PB3   ; LED ON
CBI PORTB, PB2   ; LED OFF
rjmp GREEN_ON_LCD
rjmp loop

RED_ON_LCD:
LCD_send_a_character 0x4C ; 'L'
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x47 ; 'G'
LCD_send_a_character 0x48 ; 'H'
LCD_send_a_character 0x54 ; 'T'
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x4E ; 'N'
LCD_send_a_character 0x54 ; 'T'
LCD_send_a_character 0x45 ; 'E'
LCD_send_a_character 0x4E ; 'N'
LCD_send_a_character 0x53 ; 'S'
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x54 ; 'T'
LCD_send_a_character 0x59 ; 'Y'
LCD_send_a_command 0xC0 ; move curser to next line
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)

LCD_send_a_character 0x4C ; 'L'
LCD_send_a_character 0x4F ; 'A'
LCD_send_a_character 0x57 ; 'B'
reti

GREEN_ON_LCD:
LCD_send_a_character 0x4C ; 'L'
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x47 ; 'G'
LCD_send_a_character 0x48 ; 'H'
LCD_send_a_character 0x54 ; 'T'
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x4E ; 'N'
LCD_send_a_character 0x54 ; 'T'
LCD_send_a_character 0x45 ; 'E'
LCD_send_a_character 0x4E ; 'N'
LCD_send_a_character 0x53 ; 'S'
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x54 ; 'T'
LCD_send_a_character 0x59 ; 'Y'
LCD_send_a_command 0xC0 ; move curser to next line
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)
LCD_send_a_character 0x20 ; ' ' (space)

LCD_send_a_character 0x48 ; 'H'
LCD_send_a_character 0x49 ; 'I'
LCD_send_a_character 0x47 ; 'G'
LCD_send_a_character 0x48 ; 'H'
reti


