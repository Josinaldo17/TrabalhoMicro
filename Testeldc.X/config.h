#ifndef __CONFIG_H
#define __CONFIG_H

#pragma config FOSC = HS
#pragma config WDT = OFF
#pragma config WDTPS = 128
#pragma config LVP = OFF
#pragma config PWRT = ON
#pragma config BORV = 0
#pragma config PBADEN = OFF
#pragma config DEBUG = OFF
#pragma config FCMEN = OFF
#pragma config IESO = OFF
#pragma config MCLRE = ON
#pragma config LPT1OSC = OFF
#pragma config STVREN = OFF

// Protótipos das funções usadas no main
void init_ports(void);
void check_motion(void);

#endif
