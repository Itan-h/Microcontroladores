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
; Latch 2
    bcf PORTC,3       
; Latch 3
; set all 8 PORTD pins to 0 
    bcf PORTD, 0
    bcf PORTC,4          

    ;movlw 0xFF
    ;movwf PORTD
    
; Latch 3
; set all 8 PORTD pins to 1 

         
    end


