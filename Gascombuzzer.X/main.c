/*
 * File:   botaointerrupcao.c
 * Author: arlis
 * Created on 13 de Abril de 2025, 12:52
 *
 * Habilitar o LPWM e o Buzzer no DP2 chaves 9 e 10
 * Ligar o Jumper RB0 JP16
 */

#include <xc.h>
#include <stdio.h> 
#include <string.h> 

#include "lcd.h" 

#pragma config FOSC = HS        // Oscilador de Alta Velocidade (HS para cristal)
#pragma config PWRT = OFF       // Power-up Timer desativado
#pragma config BOR = OFF        // Brown-out Reset desativado
#pragma config WDT = OFF        // Watchdog Timer desativado
#pragma config LVP = OFF        // Low Voltage Programming desativado
#pragma config PBADEN = OFF     // Port B A/D Enable (desabilita analógico no PORTB se precisar)
#pragma config MCLRE = ON       // Master Clear Enable (pino 4)

#define _XTAL_FREQ 20000000  // Frequência do cristal: 20 MHz

volatile unsigned char alarme_ativo = 0; // Flag para controle do alarme
volatile unsigned char alerta_ativo = 0; // Flag para controle do alarme



// --- Configuração do ADC ---
void setup_adc() {
    ADCON0 = 0b00000001; // Canal AN0 (RA0), ADC ligado (ADON = 1)
                         // CHS<3:0> = 0000 para AN0
    ADCON1 = 0b00001110; // Vref+ = VDD, Vref- = VSS, AN0 como entrada analógica (resto digital)
                         // PCFG<3:0> = 1110 (AN0 analógico, AN1-AN12 digitais)
    ADCON2 = 0b10101110; // Resultado justificado à direita (ADFM = 1), Tad = 16Tosc (ACQT = 101), Aquisição = 12Tad (ADCS = 10)
}


unsigned int read_adc() {
    ADCON0bits.GO_DONE = 1; // Inicia a conversão
    while(ADCON0bits.GO_DONE == 1); // Espera a conversão terminar
    return ((ADRESH << 8) | ADRESL); // Combina os bytes alto e baixo (10 bits)
}


void __interrupt() isr(void){
    if(INTCONbits.INT0IF){
        INTCONbits.INT0IF = 0;
   
        alarme_ativo = !alarme_ativo;
   
    }
}

void main(void) {
    // Configurações de pinos
    
    char lcd_buffer[17]; // Buffer para a string do LCD (16 caracteres + null terminator)

    // Configura o pino RA0 (pino 2) como entrada analógica para o MQ-2
    TRISAbits.TRISA0 = 1;

    // Inicializa o ADC
    setup_adc();

    // Inicializa o LCD usando a sua biblioteca
    Inicializa_LCD(); // Chama a função da sua lcd.h
    
    Posiciona_LCD(1,1); // Linha 1, Coluna 1
    Escreve_LCD("Iniciando...");   
    
    TRISBbits.TRISB0 = 1;  // Entrada (botão)
    TRISD = 0x00;          // PORTD todo como saída (LEDs)
    TRISCbits.TRISC2 = 0;  // Saída (LED alto brilho)
    TRISCbits.TRISC1 = 0;  // Saída (Buzzer)

    // Estado inicial
    PORTCbits.RC1 = 0;     // Buzzer desligado
    LATD = 0x00;           // LEDs apagados
    LATCbits.LATC2 = 0;    // Led alto brilho apagado

    // Configurações de interrupção
    INTCONbits.GIE = 1;        // Habilita interrupções globais 
    INTCONbits.INT0IE = 1;     // Habilita interrupção externa INT0
    INTCONbits.INT0IF = 0;     // Limpa flag INT0
    INTCON2bits.RBPU = 1;      // Desabilita pull-ups
    INTCON2bits.INTEDG0 = 1;   // Interrupção na borda de descida
    
    // Mensagem de boas-vindas inicial no LCD
    Posiciona_LCD(1,1); // Linha 1, Coluna 1
    Escreve_LCD("Sensor MQ-2");
    Posiciona_LCD(2,1); // Linha 2, Coluna 1
    Escreve_LCD("Iniciando...");
    
    alarme_ativo = 1;

    
        
    __delay_ms(2000);


    while(1){
        if(alarme_ativo){
            // Toca sirene
 
            LATCbits.LATC1 = !PORTCbits.RC1;  // Led alto brilho
            LATDbits.LATD7 = !PORTDbits.RD7;        
            LATDbits.LATD6 = !PORTDbits.RD6;
            LATDbits.LATD5 = !PORTDbits.RD5;
            LATDbits.LATD4 = !PORTDbits.RD4;        
            LATDbits.LATD3 = !PORTDbits.RD3;
            LATDbits.LATD2 = !PORTDbits.RD2;
            LATDbits.LATD1 = !PORTDbits.RD1;        
            LATDbits.LATD0 = !PORTDbits.RD0;
            LATCbits.LATC2 = !PORTCbits.RC2;
            __delay_us(100000);

        } else {
            
            PORTCbits.RC1 = 0; // Garante que o buzzer fica desligado
            TRISDbits.TRISD7 = 0;     
            TRISDbits.TRISD6 = 0;       //Habilitar D7 como porta de saída
            TRISDbits.TRISD5 = 0; 
            TRISDbits.TRISD4 = 0;     
            TRISDbits.TRISD3 = 0;       //Habilitar D7 como porta de saída
            TRISDbits.TRISD2 = 0;
            TRISDbits.TRISD1 = 0;     
            TRISDbits.TRISD0 = 0;       //Habilitar D7 como porta de saída
            TRISCbits.TRISC2 = 0;       //Habilitar C2 como porta de saída     
        }
        
        
        unsigned int adc_value = read_adc(); // Lê o valor do ADC (0-1023)

        // Limpa a segunda linha para exibir os dados antes de escrever
        Posiciona_LCD(2,1);
        Escreve_LCD("                "); // Escreve espaços para limpar a linha
        
        // Exibe o valor bruto do ADC na primeira linha
        Posiciona_LCD(1,1);
        sprintf(lcd_buffer, "ADC: %04d", adc_value); // Formata para 4 dígitos com preenchimento
        Escreve_LCD(lcd_buffer);

        // Lógica de indicação de gás na segunda linha
        Posiciona_LCD(2,1);
        if (adc_value > 600) { // Limiar de detecção (AJUSTE ISSO APÓS TESTES)
            Escreve_LCD("Alerta: Gas!");
        } else if (adc_value > 300) {
            Escreve_LCD("Gas Detectado");
            alarme_ativo = 1;
        }
        else {
            Escreve_LCD("Ar Puro");

        }

        __delay_ms(500); // Atualiza a cada 500ms
    }
}
