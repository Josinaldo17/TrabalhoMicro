#include <xc.h>
#include "lcd.h"
#include "config.h"

#define _XTAL_FREQ 4000000

void init_ports(void);

void main(void) {
    init_ports();

    LCD_Init();
    LCD_SetCursor(1, 2);
    LCD_WriteString("Ola");

    
    while(1) {
        // Loop infinito sem sensor
    }
}

void init_ports(void) {
    TRISD = 0x00; // LCD como saída
    TRISE = 0x00; // Controle do LCD como saída
    PORTD = 0x00;
    PORTE = 0x00;
}
