

; Configures to run in BK300 DEVELOPMENT BOARD.
    __config 0x3F39
    LIST   P=16F877A
    #INCLUDE <P16F877A.INC> 
  
    CBLOCK 0X020
    COUNTER_1, COUNTER_2, COUNTER_3
    ENDC
    ORG 0x0
start1:
    bsf STATUS, RP0
    clrf TRISD
    bcf STATUS,RP0 
    bsf PORTC,5    ; para activar los leds.
    
MAIN:
    movlw 0x5A
    movwf PORTD
    call delay_1sec 
    movlw 0xA5
    movwf PORTD
    call delay_1sec
    goto MAIN    
delay_1sec: 
    
    movlw 0xAC
    movwf COUNTER_1
    movlw 0X13
    movwf COUNTER_2
    movlw 0X06
    movwf COUNTER_3
LOOP:
    decfsz COUNTER_1,1
    goto LOOP
    decfsz COUNTER_2, 1
    goto LOOP
    decfsz COUNTER_3, 1
    goto LOOP
    nop
    #INCLUDE "ConfigBoard.inc"
    return
    end

