/* 
 * File:   p34.c
 * Author: itahe
 *
 * Created on 17 de octubre de 2023, 12:22 PM
 */
#pragma config FOSC = XT        // Oscillator Selection bits (XT oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

#define _XTAL_FREQ 4000000
/*
 * 
 */

void delay500u(){
    {
    TMR1H = 0xFF;
    TMR1L = 0x83;
    
    while(PIR1bits.TMR1IF == 0);}
    
    PIR1bits.TMR1IF = 0;
}

int main(){
    TRISD0 = 0;
    T1CON = 0x21;
    
    while(1){
        RD0 = 1;
        delay500u();
        RD0 = 0;
        delay500u();
    }
    
    return 0;
}



