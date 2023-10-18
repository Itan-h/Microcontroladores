   __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _BOREN_OFF & _LVP_ON & _CPD_OFF & _WRT_OFF & _CP_OFF
 
     errorlevel -302  
     LIST   P=16F877A 
    #INCLUDE <P16F877A.INC>
    
    CBLOCK 0X20
    COUNT1 
    COUNT2 
    COUNT3
    ENDC
 
 
    org 0x00
    banksel TRISC       ;go to bank 1
    bcf OPTION_REG, 7
    clrf TRISD              ;clear TRISC - set all PORTB as output   
    clrf TRISC
    clrf TRISA
    bsf TRISB,0            ;set RB0 as input.
    banksel PORTC     ; go to bank
    movlw 0x01
    movwf PORTD
    movlw 0x20
    movwf PORTC
    bcf PORTA, 3
    

 
main:    
    btfsc PORTB,0      ;check if RB0 button is pressed    
    goto ascending
    btfss PORTB,0
    goto descending ;
    goto main
    
ascending:
    incf PORTD,1          ;if pressed increment PORTC
    call delay 
    movlw 0x09           ;for checking if PORTB = A: put 0x0A to W    
    subwf PORTD,0     ;subtract 0x0A from W register
    btfss STATUS,2     ;check zero flag.
    goto main             ;if not zero (PORTC is not equal to 0x0A), go back to main
    clrf PORTD
    call delay;if zero (PORTC is equal to 0x0A), set PORTC to zero
    goto main            ;go back and check the button again
    
descending:
    decf PORTD,1       ;if pressed decrement PORTB
    call delay
    btfss STATUS,2     ;check zero flag.
    goto main          ;if not zero (PORTC is not equal to 0x0A), go back to main
    goto ten         ;if zero (PORTC is equal to 0x0A), set PORTC to zero
    
ten:
    movlw 0x0A
    movwf PORTD
    goto main
    
  
delay:
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
    
    return
    end 