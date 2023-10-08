__config 0xFF39
LIST   P=16F877A 
#INCLUDE <P16F877A.INC>
    
org 0x00

banksel TRISB
bcf TRISB, 0
movlw 0x03
movwf OPTION_REG
banksel PORTB
    
main:
    bsf PORTB, 0
    call Delay
    bcf PORTB, 0
    call Delay
    goto main
    
Delay:
    movlw d'20'
    movwf TMR0
Loop:
    btfss INTCON, T0IF
    goto Loop
    bcf INTCON, T0IF
    return

end


