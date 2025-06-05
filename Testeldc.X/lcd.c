#include <xc.h>
#include "lcd.h"

#define RS RE0
#define RW RE1
#define EN RE2
#define LCD_Port LATD

void LCD_Init(void) {
    TRISD = 0x00;
    TRISE = 0x00;
    __delay_ms(20);
    LCD_Command(0x38);
    LCD_Command(0x0C);
    LCD_Command(0x06);
    LCD_Command(0x01);
    __delay_ms(2);
}

void LCD_Command(unsigned char cmd) {
    LCD_Port = cmd;
    RS = 0;
    RW = 0;
    EN = 1;
    __delay_us(10);
    EN = 0;
    __delay_ms(2);
}

void LCD_Char(unsigned char data) {
    LCD_Port = data;
    RS = 1;
    RW = 0;
    EN = 1;
    __delay_us(10);
    EN = 0;
    __delay_ms(2);
}

void LCD_WriteString(const char *str) {
    while(*str) LCD_Char(*str++);
}

void LCD_Clear(void) {
    LCD_Command(0x01);
    __delay_ms(2);
}

void LCD_SetCursor(unsigned char row, unsigned char column) {
    unsigned char pos;
    pos = (row == 1) ? (0x80 + column - 1) : (0xC0 + column - 1);
    LCD_Command(pos);
}
