;*******************************************
;ConfigBoard.inc
;Ing Miguel Angel Perez Solano: Instituto Tecnologivo de Oaxaca
; Departamento de Ingenieria Electrónica.   
;********************************************/

    LIST P=16F877A
    #INCLUDE <P16F877A.INC>	 

; Set all port pins as "output" 
    banksel TRISA
    clrf TRISA	   
    clrf TRISB
    clrf TRISC
    clrf TRISD
    clrf TRISE
    banksel PORTD
   
; set all 8 PORTD pins to 1
    movlw 0xFF
    movwf PORTD     

; Set "latch output enable" ON for all three 74HC573 latches
    bcf PORTA,3        

; Latch 1
    bsf PORTC,5        
    nop
    nop  
    bcf PORTC,5        
; Latch 2
    bsf PORTC,3
    nop
    nop  
    bcf PORTC,3          
; Latch 3
; set all 8 PORTD pins to 0 
    clrf PORTD
    bsf PORTC,4         
    nop
    nop 
    bcf PORTC,4          

; Latch 3
; set all 8 PORTD pins to 1 
    movlw 0xFF
    movwf PORTD;
; stepper
    bsf PORTC,2        
; Beeper
    bcf PORTE,0;        
; Relay
    bcf PORTE,1        
; MAX485
    bcf PORTE,2          
    end


