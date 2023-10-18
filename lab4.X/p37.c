/* 
 * File:   p37.c
 * Author: itahe
 *
 * Created on 17 de octubre de 2023, 01:24 PM
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

char value = 0;

void interrupt timerIsr(){
    if(TMR1IF == 1){
        value =~ value; 
        TMR1H = 0xCF;
        TMR1L = 0x2C;
        TMR1IF = 0;
    }
}

int main() {
    TRISD0 = 0;
    T1CON = 0x30;
    TMR1IE = 1;
    GIE = 1;
    PEIE = 1;
    TMR1ON = 1;
    
    while(1){
        PORTD = value;
    }
    
    return 0;
}

