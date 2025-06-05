#ifndef LCD_H_
#define LCD_H_

#define _XTAL_FREQ 4000000  // Crystal frequency for delay timing

// =================================================================
// Display: LCD 2x16 or 4x16 (Parallel Mode)
// =================================================================


// ==========================
// Hardware Pin Definitions
// ==========================
#define RS_LCD PORTEbits.RE0
#define EN_LCD PORTEbits.RE1
#define DATA_LCD PORTD

// ==========================
// LCD Command Function
// ==========================
void LCD_Command(unsigned char cmd) {
    RS_LCD = 0;
    DATA_LCD = cmd;
    EN_LCD = 1;
    __delay_ms(2);
    EN_LCD = 0;
    __delay_ms(2);
}

// ==========================
// Set Cursor Position
// ==========================
void LCD_SetCursor(unsigned char row, unsigned char col) {
    static const unsigned char row_offsets[] = {0x80, 0xC0, 0x90, 0xD0};
    if (row >= 1 && row <= 4) {
        LCD_Command(row_offsets[row - 1] + (col - 1));
    }
}

// ==========================
// Write a Character to LCD
// ==========================
void LCD_WriteChar(unsigned char data) {
    RS_LCD = 1;
    DATA_LCD = data;
    EN_LCD = 1;
    __delay_ms(2);
    EN_LCD = 0;
    __delay_ms(2);
}

// ==========================
// Write a String to LCD
// ==========================
void LCD_WriteString(const char* str) {
    while (*str) {
        LCD_WriteChar(*str++);
    }
}

// ==========================
// Initialize the LCD
// ==========================
void LCD_Init(void) {
    static const unsigned char init_seq[] = {0x38, 0x38, 0x38, 0x0C, 0x06, 0x01};
    ADCON1 = 0x0F;    // Set all PORTA/PORTB as digital I/O
    PORTD = 0x00;
    PORTE &= 0xF8;
    TRISD = 0x00;
    TRISE &= 0xF8;

    for (unsigned char i = 0; i < sizeof(init_seq); i++) {
        LCD_Command(init_seq[i]);
        __delay_ms(5);
    }
}

#endif  // LCD_H_
