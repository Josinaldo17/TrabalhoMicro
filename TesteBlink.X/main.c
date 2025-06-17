#include <xc.h>
#include <stdio.h>
#include <string.h>

#pragma config FOSC = HS
#pragma config WDT = OFF, LVP = OFF, PBADEN = OFF, MCLRE = ON

#define _XTAL_FREQ 20000000

#define ESP_TX PORTCbits.RC6 // TX do PIC ? RX do ESP
#define ESP_RX PORTCbits.RC7 // RX do PIC ? TX do ESP

volatile unsigned char temperatura = 20;
char comando[128];

// Configura UART
void uart_init() {
    TRISC6 = 0; // TX como saída
    TRISC7 = 1; // RX como entrada
    TXSTA = 0b00100100; // TX habilitado, modo assíncrono, BRGH = 1
    RCSTA = 0b10010000; // Serial ligada, RX habilitado
    SPBRG = 129;        // Baud rate para 9600 com Fosc = 20MHz
}

// Envia caractere
void uart_send(char data) {
    while (!TXSTAbits.TRMT);
    TXREG = data;
}

// Envia string
void uart_send_str(const char* s) {
    while (*s) uart_send(*s++);
}

// Função para enviar comando AT ao ESP-01
void envia_temp_para_blynk(unsigned char temp) {
    sprintf(comando, "AT+CIPSTART=\"TCP\",\"blynk.cloud\",80\r\n");
    uart_send_str(comando);
    __delay_ms(2000); // tempo para conectar

    // Cria a string HTTP GET
    sprintf(comando,
        "GET /external/api/update?token=KpY5iBgwR5AlbyLurR8T8agFnDBtYJxj&v0=%d HTTP/1.1\r\nHost: blynk.cloud\r\n\r\n",
        temp);

    int tamanho = strlen(comando);
    char cmd_len[32];
    sprintf(cmd_len, "AT+CIPSEND=%d\r\n", tamanho);
    uart_send_str(cmd_len);
    __delay_ms(1000);

    uart_send_str(comando); // envia a requisição real
    __delay_ms(2000);
}

// Interrupção: botão em RB0 alterna temperatura
void __interrupt() isr() {
    if (INTCONbits.INT0IF) {
        INTCONbits.INT0IF = 0;
        temperatura = (temperatura == 20) ? 30 : 20;
        envia_temp_para_blynk(temperatura);
    }
}

void main() {
    uart_init();

    TRISBbits.TRISB0 = 1; // botão
    INTCONbits.INT0IE = 1;
    INTCONbits.INT0IF = 0;
    INTCONbits.GIE = 1;
    INTCON2bits.INTEDG0 = 0; // borda de descida

    __delay_ms(3000); // espera o ESP-01 iniciar
    envia_temp_para_blynk(temperatura); // Envia valor inicial

    while (1) {
        // Aqui poderia colocar watchdog/reset ou verificação periódica
        __delay_ms(1000);
    }
}

