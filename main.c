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

#include <math.h>

#define Vcc 5.0          // Tensão de alimentação
#define R_FIXED 10000.0  // Resistor fixo de 10k
#define BETA 3950.0      // Constante Beta do NTC
#define T0 298.15        // 25°C em Kelvin
#define R0 10000.0       // Resistência do NTC a 25°C

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
volatile unsigned char alarme_leve = 0; // Flag para controle do alarme


// --- Configuração do ADC ---
void setup_adc() {
    ADCON0 = 0b00000001; // Canal AN0 (RA0), ADC ligado (ADON = 1)
                         // CHS<3:0> = 0000 para AN0
    ADCON1 = 0b00001110; // AN0 analógico, AN1-AN12 digitais // Vref+ = VDD, Vref- = VSS, AN0 como entrada analógica (resto digital)
                         // PCFG<3:0> = 1110 (AN0 analógico, AN1-AN12 digitais)
    ADCON2 = 0b10101110; // Resultado justificado à direita (ADFM = 1), Tad = 16Tosc (ACQT = 101), Aquisição = 12Tad (ADCS = 10)
}


unsigned int read_adc_channel(unsigned char channel) {
    ADCON0bits.CHS = channel;  // Seleciona canal
    __delay_us(50);            // Aguarda estabilização
    ADCON0bits.GO_DONE = 1;
    while (ADCON0bits.GO_DONE);
    return ((ADRESH << 8) | ADRESL);
}
//unsigned int read_adc() {
  //  ADCON0bits.GO_DONE = 1; // Inicia a conversão
  //  while(ADCON0bits.GO_DONE == 1); // Espera a conversão terminar
  //  return ((ADRESH << 8) | ADRESL); // Combina os bytes alto e baixo (10 bits)
//}


void __interrupt() isr(void){
    if(INTCONbits.INT0IF){
        INTCONbits.INT0IF = 0;
   
        alarme_ativo = 0;
        alarme_leve = 0;
   
    }
}



float calculaTemperaturaSimples(unsigned int adc_valor) {
    float Vout = (adc_valor * Vcc) / 1023.0;

    float R = (R_FIXED * Vout) / (Vcc - Vout);

    float T_kelvin = 1.0 / ( (1.0 / T0) + (1.0 / BETA) * log(R / R0) );

    float temperatura = T_kelvin - 273.15;

    return temperatura;
}


void main(void) {
    // Configurações de pinos
    
    char lcd_buffer[17]; // Buffer para a string do LCD (16 caracteres + null terminator)

    // Configura o pino RA0 (pino 2) como entrada analógica para o MQ-2
    TRISAbits.TRISA0 = 1;
    TRISAbits.TRISA1 = 1;

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
    



    while(1){
         if(alarme_leve){
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
            __delay_us(110000);

        } else {
        	
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
	            __delay_us(60000);
	
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
            
			 
        }
        
        
        unsigned int adc_gas = read_adc_channel(0);  
        unsigned int adc_temp = read_adc_channel(1); 
        
        float temperatura = calculaTemperaturaSimples(adc_temp);
    
        // Exibe o valor bruto do ADC na primeira linha
        Posiciona_LCD(1,1);
        sprintf(lcd_buffer, "ADC: %04d", adc_gas); // Formata para 4 dígitos com preenchimento
        Escreve_LCD(lcd_buffer);
        
        
        Posiciona_LCD(2,1);
        sprintf(lcd_buffer, "Temp: %2.1f C", temperatura);
        Escreve_LCD(lcd_buffer);
        
        __delay_ms(500); // Atualiza a cada 500ms

        // Lógica de indicação de gás na segunda linha
        Posiciona_LCD(1,1);
        if (adc_gas > 400) { // Limiar de detecção (AJUSTE ISSO APÓS TESTES)
            Posiciona_LCD(1,1);
            Escreve_LCD("                ");
             // Atualiza a cada 500ms
            Posiciona_LCD(1,1);
            Escreve_LCD("Alerta: Gas!");
            alarme_ativo = 1;
            

        } else if (adc_gas > 200) {
            Posiciona_LCD(1,1);
            Escreve_LCD("                ");
             // Atualiza a cada 500ms
            Posiciona_LCD(1,1);
            Escreve_LCD("Gas Detectado");
            alarme_ativo = 1;
            
        }
        else {
            
            Posiciona_LCD(1,1);
            Escreve_LCD("                ");
             // Atualiza a cada 500ms
            Posiciona_LCD(1,1);
            Escreve_LCD("Ar Puro");
           

        }
        
        Posiciona_LCD(2,14); // Posição para status temperatura
        if (temperatura > 45.0) {
            Posiciona_LCD(2,1);
            Escreve_LCD("                ");
          
            Posiciona_LCD(2,1);
            Escreve_LCD("Temp: Alta");
            alarme_ativo = 1;
            __delay_ms(500);

        } else {
             Posiciona_LCD(2,1);
            Escreve_LCD("                ");

            Posiciona_LCD(2,1);
            Escreve_LCD("Temp: Normal");
            __delay_ms(500);
        }
      


    }
}
