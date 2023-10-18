/* 
 * File:   p28.c
 * Author: itahe
 *
 * Created on 16 de octubre de 2023, 12:19 PM
 */
#pragma config FOSC = XT        // Oscillator Selection bits (XT oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#define _XTAL_FREQ 4000000

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

unsigned char counter=1;

int main() {
    
    TRISB = 0;
    while(1)
    {
        PORTB = counter;
        __delay_us(200);
        counter += 1;
    }
    
    return 0;
}

