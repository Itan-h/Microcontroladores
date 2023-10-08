__config 0xFF39
list P=16F877A
#include <P16F877A.inc>
    
org 0x00

banksel TRISA
movlw 0x08
movwf OPTION_REG
movlw 0x06
movwf ADCON1
bcf TRISA, 2
banksel PORTA
    
Main:
    bcf PORTA, 2
    call Delay
    bsf PORTA, 2
    call Delay
    goto Main
    
Delay:
    movlw 0x06
    movwf TMR0
Loop:
    btfss INTCON, TMR0IF
    goto Loop
    bcf INTCON, TMR0IF
    return
    
end