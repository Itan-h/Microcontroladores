/* 
 * File:   p26.c
 * Author: itahe
 *
 * Created on 16 de octubre de 2023, 11:53 PM
 */

#pragma config FOSC = XT        // Oscillator Selection bits (XT oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config BOREN = OFF      // Brown-out Reset Enable bit (BOR disabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#include <xc.h>
#include <stdio.h>
#include <stdlib.h>

#define _XTAL_FREQ 4000000
#define ON 1;
#define OFF 0;
/*
 * 
 */



void unKilo(){
    RB0 = ON;
    __delay_us(500);
    RB0 = OFF;
    __delay_us(500);
}

void diezKilo(){
    RB1 = ON;
    __delay_us(50);
    RB1 = OFF;
    __delay_us(50);
}

void cienKilo(){
    RB2 = ON;
    __delay_us(5);
    RB2 = OFF;
    __delay_us(5);
}

void trescientosKilo(){
    RB3 = ON;
    __delay_us(1.6);
    RB3 = OFF;
    __delay_us(1.6);
}

void diez(){
    RB4 = ON;
    __delay_ms(50);
    RB4 = OFF;
    __delay_ms(50);
}

int main() {
    TRISB = 0;
    
    while(1){
        unKilo();
    }
    return 0;
}