__config 0xFF39
LIST   P=16F877A 
#INCLUDE <P16F877A.INC>
    
org 0x00

banksel TRISA
    bcf TRISB, 2
    bcf OPTION_REG, T0SE
    movlw 0x07
    movlw ADCON1
banksel PORTA
    bcf PORTB, 2
    
main:
    ;bcf PORTB, 2
    movlw d'247'
    movwf TMR0

test:
    btfss INTCON, TMR0IF
    goto test
    comf PORTB
    bcf INTCON, TMR0IF
    goto main
    
end





