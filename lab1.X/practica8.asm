__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_ON &_CPD_OFF & _WRT_OFF & _CP_OFF
errorlevel -302 ; elimina errores innecesarios
LIST P=16F877A
#INCLUDE <P16F877A.INC>


COUNT1 EQU 20h
COUNT2 EQU 21h
COUNT3 EQU 22h
org 0x00
bsf STATUS,RP0 ;bank 1
bcf OPTION_REG, 7
clrf TRISD ;make all PORTD output
bcf STATUS,RP0 ;bank 0
bsf PORTC,5 
 
main:
    btfss PORTB,0 ; If RB0 if low execute next instruction, otherwise skip.
    goto sub1 ; program goes to sub1 if RB0 is low
    btfsc PORTB,0 ;If RB0 if high execute next instruction, otherwise skip.
    goto sub2; program goes to sub2 if RB0 is high.
    goto main

sub1:
    movlw 0x0F
    movwf PORTD; make low nibble pins in PORTD high, high nibble in low
    call delay1; delay subroutine
    movlw 0xF0
    movwf PORTD ;;make high nibble pins in PORTD high, low nibble in low.
    call delay1
    goto main

sub2:
    movlw 0xC3
    movwf PORTD
    call delay2
    movlw 0x3C
    movwf PORTD
    call delay2
    goto main

delay1:
    decfsz COUNT1,1 ;decrement COUNT1 variable until zero
    goto delay1
    decfsz COUNT2,1 ;decrement COUNT2, if not zero, go back to loop1
    goto delay1
    return

delay2:
    
    movlw 0xAC
    movwf COUNT1
    movlw 0X13
    movwf COUNT2
    movlw 0x06
    movwf COUNT3
    
loop:
    decfsz COUNT1,1
    goto loop
    decfsz COUNT2,1
    goto loop
    decfsz COUNT3,1
    goto loop
    nop
    #INCLUDE "ConfigBoard.inc"
    return


end


