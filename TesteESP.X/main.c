#include <xc.h>
#include <stdio.h>
#include <string.h>
#include "lcd.h"

#pragma config FOSC = HS       
#pragma config PWRT = OFF      
#pragma config BOR = OFF       
#pragma config WDT = OFF       
#pragma config LVP = OFF       
#pragma config PBADEN = OFF    
#pragma config MCLRE = ON      

#define _XTAL_FREQ 20000000

void uart_init(void) {
    SPBRG = 129;       
    TXSTA = 0x24;      
    RCSTA = 0x90;      
    TRISCbits.TRISC6 = 0; 
    TRISCbits.TRISC7 = 1; 
}

void uart_send_char(char c) {
    while(!PIR1bits.TXIF);
    TXREG = c;
}

void uart_send_string(const char *str) {
    while(*str) uart_send_char(*str++);
}

int uart_receive_string(char *buffer, int max_len, int timeout_ms) {
    int i = 0;
    unsigned int timeout = 0;
    
    while(timeout < timeout_ms) {
        if(PIR1bits.RCIF) {
            char c = RCREG;
            if(c == '\r' || c == '\n') {
                if(i > 0) break;
                else continue;
            }
            if(i < max_len - 1) {
                buffer[i++] = c;
            }
        } else {
            __delay_ms(1);
            timeout++;
        }
    }
    buffer[i] = 0;
    return i > 0;
}

void check_esp() {
    char resp[30];
    
    uart_send_string("AT\r\n");
    if(uart_receive_string(resp, sizeof(resp), 1000)) {
        if(strstr(resp, "OK") != NULL){
            Posiciona_LCD(1,1);
            Escreve_LCD("ESP OK        ");
        } else {
            Posiciona_LCD(1,1);
            Escreve_LCD("ESP erro      ");
        }
    } else {
        Posiciona_LCD(1,1);
        Escreve_LCD("ESP no resp   ");
    }
}

void main(void) {
    Inicializa_LCD();
    Posiciona_LCD(1,1);
    Escreve_LCD("Teste ESP...");
    
    uart_init();
    
    while(1) {
        check_esp();
        __delay_ms(2000);
    }
}

