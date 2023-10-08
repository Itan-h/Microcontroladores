__config 0xFF39
LIST   P=16F877A 
#INCLUDE <P16F877A.INC>

org 0x00
goto Main
    
org 0x04
goto ISR_routine
org 0x0A
    
Main: 
    banksel TRISB
    bcf TRISB, 5
    clrf TRISD
    bsf INTCON, 7
    bsf INTCON, 6
    bsf PIE1, 0
    banksel PORTB
    
    movlw 0x30 
    movwf T1CON
    bcf PIR1, 0
    bsf PORTB, 5
    bsf T1CON, 0
    
Loop:
    movf PORTC, 0 
    movwf PORTD
    goto Loop
    
ISR_routine:
    movlw 0xFF
    movwf TMR1H
    movlw 0x83
    movwf TMR1L
    comf PORTB
    bcf PIR1, 0
    retfie

end   


