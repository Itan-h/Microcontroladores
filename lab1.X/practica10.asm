__config 0x3F39
errorlevel -302  
LIST   P=16F877A 
#INCLUDE <P16F877A.INC>

    
cblock 0x20
    num
    counter1
    counter2
    counter3
endc
    
org 0x00
  
inicio
    banksel TRISD
    bcf OPTION_REG, 7
    clrf TRISD
    clrf TRISC
    clrf TRISA
    movlw 0x06
    movwf ADCON1
    banksel PORTD
    movlw 0x08
    movwf PORTC
    bcf PORTA, 3
    movlw 0x00
    movwf num
    
Main:
    call Delay
    movf num, W
    call seg7
    movwf PORTD
    incf num, 1
    btfsc PORTB, 0
    clrf num
    movlw 0x10            
    subwf num,0     
    btfss STATUS,2
    goto Main
    clrf num
    goto Main
    
seg7:
    addwf PCL, 1
    retlw b'01000000'
    retlw b'01111001'
    retlw b'00100100'
    retlw b'00110000'
    retlw b'00011001'
    retlw b'00010010'
    retlw b'00000010'
    retlw b'01111000'
    retlw b'00000000'
    retlw b'00010000'
    retlw b'00001000'
    retlw b'00000011'
    retlw b'01000110'
    retlw b'00100001'
    retlw b'00000110'
    retlw b'00001110'
    
Delay: 
    movlw 0x03
    movwf counter3
    movlw 0x8A
    movwf counter2
    movlw 0x54
    movwf counter1
    loop
	decfsz counter1, 1
	goto loop
	decfsz counter2, 1
	goto loop
	decfsz counter3, 1
	goto loop
	nop 
	;#INCLUDE "ConfigBoard.inc" 
	return
 
end
 
    